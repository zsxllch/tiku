<template>
  <div class="home" style="padding: 7px">
    <div style="margin: 6px 0;">
        <el-select v-model="questionType"  placeholder="请选择试题类型" style="width: 13%" clearable>
          <el-option label="单选题" value="单选题" />
          <el-option label="多选题" value="多选题" />
          <el-option label="填空题" value="填空题" />
          <el-option label="判断题" value="判断题" />
          <el-option label="简答题" value="简答题" />
        </el-select>
      <el-button type="primary" style="margin-left:1px" @click="load" >搜索</el-button>

      <el-select v-model="bankName" placeholder="请选择题库" style="width: 12%;margin-left: 40px" clearable>
        <el-option label="公共题库" value="公共题库" />
<!--        <el-option label="私人题库" value="私人题库" />-->
        <el-option
            v-for="item in dataBankList"
            :key="item"
            :label="item"
            :value="item"
        />
      </el-select>
      <el-button type="primary" style="margin-left:1px" @click="load" >搜索</el-button>

      <el-select v-model="questionLevel" placeholder="请选择难度级别" style="width: 12%;margin-left: 40px" clearable>
        <el-option label="容易" value="容易"></el-option>
        <el-option label="较易" value="较易"></el-option>
        <el-option label="中等" value="中等"></el-option>
        <el-option label="较难" value="较难"></el-option>
        <el-option label="很难" value="很难"></el-option>
      </el-select>
      <el-button type="primary" style="margin-left:1px" @click="load" >搜索</el-button>


      <el-select v-model="courseType" placeholder="请选择课程" style="width: 12%;margin-left: 40px" clearable>
        <el-option label="公共课程" value="公共课程" />
        <el-option
            v-for="item in dataList"
            :label="item"
            :value="item"
        />
      </el-select>
      <el-button type="primary" style="margin-left:1px" @click="load" >搜索</el-button>

      <el-input v-model="questionSubject" placeholder="根据题目内容搜索" style="width: 13%;margin-left: 45px" clearable>
        <template #suffix>
          <el-icon class="el-input__icon"><Search/></el-icon>
        </template>
      </el-input>
      <el-button type="primary" style="margin-left:1px" @click="load" >搜索</el-button>

    </div>

    <!--    <img alt="Vue logo" src="../assets/logo.png">-->
    <div style="margin: 10px 0">
      <el-checkbox-group v-model="visibleColumns">
        <el-checkbox label="questionId">试题编号</el-checkbox>
        <el-checkbox label="questionType">试题类型</el-checkbox>
        <el-checkbox label="questionLevel">难度级别</el-checkbox>
        <el-checkbox label="courseType">课程类型</el-checkbox>
        <el-checkbox label="questionPoint">知识点</el-checkbox>
        <el-checkbox label="bankName">题库名称</el-checkbox>
        <el-checkbox label="questionSubject">题干</el-checkbox>
        <el-checkbox label="questionAnswer">答案</el-checkbox>
        <el-checkbox label="optionA">选项A</el-checkbox>
        <el-checkbox label="optionB">选项B</el-checkbox>
        <el-checkbox label="optionC">选项C</el-checkbox>
        <el-checkbox label="optionD">选项D</el-checkbox>
        <el-checkbox label="questionImage">图片</el-checkbox>
        <el-checkbox label="questionDesc">描述</el-checkbox>
        <el-checkbox label="createTime">创建时间</el-checkbox>
      </el-checkbox-group>
    </div>

<!--     全部 含选择题-->
    <el-table :data="tableData" stripe border style="width: 1250px" v-show="showChoiceTable">

      <el-table-column prop="questionId" label="试题编号" width="110" sortable v-if="visibleColumns.includes('questionId')"/>
      <el-table-column prop="questionType" label="试题类型" width="100" v-if="visibleColumns.includes('questionType')"/>
      <el-table-column prop="questionLevel" label="难度级别" width="100" v-if="visibleColumns.includes('questionLevel')"/>
      <el-table-column prop="courseType" label="课程类型" width="100" v-if="visibleColumns.includes('courseType')"/>
      <el-table-column prop="questionPoint" label="知识点" width="120" v-if="visibleColumns.includes('questionPoint')"/>
      <el-table-column prop="bankName" label="题库名称" width="100" v-if="visibleColumns.includes('bankName')"/>
      <el-table-column prop="questionSubject" label="题干" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('questionSubject')"/>
      <el-table-column prop="optionA" label="选项A" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('optionA')"/>
      <el-table-column prop="optionB" label="选项B" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('optionB')"/>
      <el-table-column prop="optionC" label="选项C" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('optionC')"/>
      <el-table-column prop="optionD" label="选项D" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('optionD')"/>
      <el-table-column prop="questionAnswer" label="答案" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('questionAnswer')"/>
      <el-table-column prop="questionImage" label="图片" width="100" v-if="visibleColumns.includes('questionImage')">
        <template #default="scope">
          <el-image
              style="width: 100px; height: 60px"
              :src="scope.row.questionImage"
              preview-teleported
              :preview-src-list="[scope.row.questionImage]"
          >
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="questionDesc" label="描述" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('questionDesc')"/>
      <el-table-column prop="createTime" label="创建时间" width="150" show-overflow-tooltip="true" v-if="visibleColumns.includes('createTime')"/>

      <el-table-column fixed="right" label="操作" width="150">
        <template #default="scope">
          <el-button  type="primary" size="small" @click="handleEdit(scope.row)">编辑</el-button>
          <el-popconfirm title="你确定删除吗?" @confirm="handleDelete(scope.row.questionId)">
            <template #reference="scope">
              <el-button  type="danger" size="small" >删除</el-button>
            </template>
          </el-popconfirm>

        </template>
      </el-table-column>
    </el-table>
<!--    其他题-->
    <el-table :data="tableData" stripe border style="width: 100%" v-show="showTable">

      <el-table-column prop="questionId" label="试题编号" width="110" sortable v-if="visibleColumns.includes('questionId')"/>
      <el-table-column prop="questionType" label="试题类型" width="100" v-if="visibleColumns.includes('questionType')"/>
      <el-table-column prop="questionLevel" label="难度级别" width="100" v-if="visibleColumns.includes('questionLevel')"/>
      <el-table-column prop="courseType" label="课程类型" width="100" v-if="visibleColumns.includes('courseType')"/>
      <el-table-column prop="questionPoint" label="知识点" width="120" v-if="visibleColumns.includes('questionPoint')"/>
      <el-table-column prop="bankName" label="题库名称" width="90" v-if="visibleColumns.includes('bankName')"/>
      <el-table-column prop="questionSubject" label="题干" show-overflow-tooltip="true" v-if="visibleColumns.includes('questionSubject')"/>
      <el-table-column prop="questionAnswer" label="答案" width="100"  show-overflow-tooltip="true" v-if="visibleColumns.includes('questionAnswer')"/>
      <el-table-column prop="questionImage" label="图片" width="100" v-if="visibleColumns.includes('questionImage')">
        <template #default="scope">
          <el-image
              style="width: 100px; height: 60px"
              :src="scope.row.questionImage"
              preview-teleported
              :preview-src-list="[scope.row.questionImage]"
          >
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="questionDesc" label="描述" width="90" show-overflow-tooltip="true" v-if="visibleColumns.includes('questionDesc')"/>
      <el-table-column prop="createTime" label="创建时间" width="150" v-if="visibleColumns.includes('createTime')"/>

      <el-table-column fixed="right" label="操作" width="150">
        <template #default="scope">
          <el-button  type="primary" size="small" @click="handleEdit(scope.row)">编辑</el-button>
          <el-popconfirm title="你确定删除吗?" @confirm="handleDelete(scope.row.questionId)">
            <template #reference="scope">
              <el-button  type="danger" size="small" >删除</el-button>
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <!--    分页-->
    <div style="margin: 10px 0">
      <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[5, 10, 20, 30]"
          :small="small"
          :disabled="disabled"
          :background="background"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
      />

      <!--     弹窗-->
      <el-dialog v-model="dialogFormVisible" title="编辑">
        <el-form :model="ruleForm" style="width: 80%" >
          <el-form-item label="题目" prop="questionSubject"  :label-width="formLabelWidth">
            <el-input v-model="ruleForm.questionSubject" type="textarea" autocomplete="off" />
          </el-form-item>
          <el-form-item label="答案" prop="questionAnswer"  :label-width="formLabelWidth">
            <el-input v-model="ruleForm.questionAnswer" type="textarea" />
          </el-form-item>
          <el-form-item label="难度级别" prop="questionLevel"  :label-width="formLabelWidth">
            <el-select v-model="ruleForm.questionLevel" placeholder="请选择难度级别">
              <el-option label="容易" value="容易"></el-option>
              <el-option label="较易" value="较易"></el-option>
              <el-option label="中等" value="中等"></el-option>
              <el-option label="较难" value="较难"></el-option>
              <el-option label="很难" value="很难"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="描述" prop="questionDesc" :label-width="formLabelWidth">
            <el-input v-model="ruleForm.questionDesc" type="textarea" />
          </el-form-item>
          
          <el-form-item label="图片" prop="questionImage" :label-width="formLabelWidth">
            <el-upload
                action="/api/file/upload"
                :show-file-list="false"
                :on-success="handleUploadSuccess"
                :before-upload="beforeUpload">
              <img v-if="ruleForm.questionImage" :src="ruleForm.questionImage" class="avatar" style="width: 100px; height: 100px; object-fit: contain;">
              <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
            </el-upload>
          </el-form-item>
        </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取消</el-button>
            <el-button type="primary" @click="save">
              确认
            </el-button>
          </span>
        </template>
      </el-dialog>

    </div>

  </div>
</template>

<script>
// @ is an alias to /src

import request from "@/utils/request";
import { Plus } from '@element-plus/icons-vue';

export default {
  name: 'TeacherQueryQuestion',
  components: {
    Plus
  },
  data(){
    return {

      questionType:'',
      bankName:'',
      questionSubject:'',
      courseType:'',
      questionLevel:'',
      currentPage:1,
      total:20,
      pageSize:5,
      small:false,
      background:false,
      disabled:false,
      dialogTableVisible:false,
      dialogFormVisible:false,
      formLabelWidth :'100px',
      showChoiceTable:true,
      showTable:false,
      ruleForm:{

      },
      visibleColumns: [
        'questionId', 'questionType', 'questionLevel', 'courseType', 
        'questionPoint', 'bankName', 'questionSubject', 'questionAnswer', 
        'questionImage', 'questionDesc'
      ],
      tableData: [],
      dataList:[],
      dataBankList:[],
      dataPointList:[]
    }
  },
  created() {
    this.load();
    this.getCourseName();
    this.getBankName();
    this.getPointName();
  },
  watch:{
    questionType(){
        if (this.questionType == '填空题' || this.questionType == '判断题' ||
                           this.questionType === '简答题') {
          this.showChoiceTable=false;
          this.showTable=true;
        }else {
          this.showChoiceTable=true;
          this.showTable=false;
        }
    }
  },
  methods:{
    // 查询
    load(){
      request.get("/question/queryQuestion", {
        params: {
            pageNum : this.currentPage ,
            pageSize: this.pageSize,
            questionSubject: this.questionSubject,
            questionType: this.questionType,
            bankName: this.bankName,
            courseType: this.courseType,
            questionLevel:this.questionLevel
        }
      }).then(res=>{
        console.log(this.questionType);
        this.total=res.data.total;
        this.tableData=res.data.records;
      })
    },
    handleEdit(row){
      this.ruleForm=JSON.parse(JSON.stringify(row));
      this.dialogFormVisible = true;
    },
    //删除
    handleDelete(val){
      //删除
      request.delete("/question/"+val).then(
          res=>{
            if (res.code==0){
              //小提示
              this. $message({
                type : "success" ,
                message:res.msg
              })
              this.load();
            }else {
              //小提示
              this. $message({
                type : "error" ,
                message:res.msg
              })
            }
          }
      )
    },
    //分页
    handleSizeChange(){
      this.load();
    },
    handleCurrentChange(){
      this.load();
    },
    // 保存数据到后端
    save(){
      //编辑
      request.put("/question",this.ruleForm).then(
          res=>{
            if (res.code==0){
              //小提示
              this. $message({
                type : "success" ,
                message:res.msg
              })
              this.load();
              this.dialogFormVisible = false;
            }else {
              //小提示
              this. $message({
                type : "error" ,
                message:res.msg
              })
              this.dialogFormVisible = false;
            }
          }
      )

    },
    handleUploadSuccess(response, file, fileList) {
        if (response.code === 0) {
            // 如果之前有图片，调用删除接口删除旧图片
            if (this.ruleForm.questionImage) {
                // 调用删除文件接口
                let formData = new FormData();
                formData.append('filePath', this.ruleForm.questionImage);
                request.post("/file/delete", formData).then(delRes => {
                    console.log("旧图片删除结果:", delRes);
                });
            }
            // 更新图片路径
            this.ruleForm.questionImage = response.data;
            this.$message.success("上传成功");
        } else {
            this.$message.error("上传失败");
        }
    },
    beforeUpload(file) {
        const isJPG = file.type === 'image/jpeg' || file.type === 'image/png';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
            this.$message.error('上传图片只能是 JPG/PNG 格式!');
        }
        if (!isLt2M) {
            this.$message.error('上传图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
    },
    getCourseName(){
      request.get("/course/getCourseName").then(res=>{
        this.dataList=res.data;
      })
    },
    getBankName(){
      request.get("/bank/getBankName").then(res=>{
        this.dataBankList=res.data;
      })
    },
    getPointName(){
      request.get("/point/getPointName").then(res=>{
        this.dataPointList=res.data;
      })
    },
  },
}

</script>

<style scoped>

</style>

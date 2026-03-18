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
        <el-option label="简单" value="简单"></el-option>
        <el-option label="一般" value="一般"></el-option>
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

    <div style="margin: 10px 0">
      <el-checkbox-group v-model="visibleColumns">
        <el-checkbox label="questionId">试题编号</el-checkbox>
        <el-checkbox label="questionType">试题类型</el-checkbox>
        <el-checkbox label="questionLevel">难度级别</el-checkbox>
        <el-checkbox label="courseType">课程类型</el-checkbox>
        <el-checkbox label="questionPoint">知识点</el-checkbox>
        <el-checkbox label="bankName">题库名称</el-checkbox>
        <el-checkbox label="questionSubject">题干</el-checkbox>
        <el-checkbox label="optionA">选项A</el-checkbox>
        <el-checkbox label="optionB">选项B</el-checkbox>
        <el-checkbox label="optionC">选项C</el-checkbox>
        <el-checkbox label="optionD">选项D</el-checkbox>
      </el-checkbox-group>
    </div>

    <!--     全部 含选择题-->
    <el-table :data="tableData" stripe border style="width: 1250px" v-show="showChoiceTable">
      <el-table-column prop="questionId" label="试题编号" width="110" sortable v-if="visibleColumns.includes('questionId')"/>
      <el-table-column prop="questionType" label="试题类型" width="100" v-if="visibleColumns.includes('questionType')"/>
      <el-table-column prop="questionLevel" label="难度级别" width="100" v-if="visibleColumns.includes('questionLevel')"/>
      <el-table-column prop="courseType" label="课程类型" width="100" v-if="visibleColumns.includes('courseType')"/>
      <el-table-column prop="questionPoint" label="知识点" width="120" v-if="visibleColumns.includes('questionPoint')"/>
      <el-table-column prop="questionSubject" label="题干"  show-overflow-tooltip="true" v-if="visibleColumns.includes('questionSubject')"/>
      <el-table-column prop="optionA" label="选项A" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('optionA')"/>
      <el-table-column prop="optionB" label="选项B" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('optionB')"/>
      <el-table-column prop="optionC" label="选项C" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('optionC')"/>
      <el-table-column prop="optionD" label="选项D" width="100" show-overflow-tooltip="true" v-if="visibleColumns.includes('optionD')"/>
      <el-table-column label="操作" width="120" fixed="right">
        <template #default="scope">
          <el-button 
            v-if="!isInPaper(scope.row)"
            type="primary" 
            size="small" 
            @click="addQuestionToPaper(scope.row)"
          >加入试卷</el-button>
          <el-button 
            v-else
            type="danger" 
            size="small" 
            @click="removeQuestion(scope.row)"
          >移出试卷</el-button>
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
      <el-table-column label="操作" width="120" fixed="right">
        <template #default="scope">
          <el-button 
            v-if="!isInPaper(scope.row)"
            type="primary" 
            size="small" 
            @click="addQuestionToPaper(scope.row)"
          >加入试卷</el-button>
          <el-button 
            v-else
            type="danger" 
            size="small" 
            @click="removeQuestion(scope.row)"
          >移出试卷</el-button>
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

      <div style="margin: 6px 0;">
          <el-form :model="form" status-icon  size="default" ref="form"  label-width="10px" class="demo-ruleForm" >
            <el-row>
              <el-col :span="8">
                <el-form-item label="试卷名称" label-width="70px">
                  <el-input v-model="form.paperName" autocomplete="off" style="width: 100%;" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="4">
                <el-form-item label="单选题分数" :label-width="formLabelWidth" :class="{ 'is-error': scoreError.choice }">
                  <el-input-number v-model="form.choiceScore" :min="0" :max="100"  />
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="多选题分数" :label-width="formLabelWidth" :class="{ 'is-error': scoreError.multi }">
                  <el-input-number v-model="form.multiScore" :min="0" :max="100"  />
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="填空题分数" :label-width="formLabelWidth" :class="{ 'is-error': scoreError.blank }">
                  <el-input-number v-model="form.blankFillingScore" :min="0" :max="100"  />
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="判断题分数" :label-width="formLabelWidth" :class="{ 'is-error': scoreError.judge }">
                  <el-input-number v-model="form.judgeScore" :min="0" :max="100"  />
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="简答题分数" :label-width="formLabelWidth" :class="{ 'is-error': scoreError.short }">
                  <el-input-number v-model="form.shortScore" :min="0" :max="100"  />
                </el-form-item>
              </el-col>
              <el-col :span="3">
                <el-button type="primary" style="margin-left:60px" @click="createPaper" >{{ isEditMode ? '保存修改' : '生成试卷' }}</el-button>
              </el-col>
            </el-row>
          </el-form>
      </div>
      
      <!-- 试卷内容预览 -->
      <div class="paper-preview" v-if="addedQuestions.length > 0">
        <h3>当前试卷预览</h3>
        
        <!-- 分析图表区域 -->
        <div style="width: 100%; margin: 0 auto 20px;">
          <div style="cursor: pointer; padding: 10px; background: #f5f7fa; border-radius: 4px; display: flex; justify-content: space-between; align-items: center;" @click="toggleChart">
            <span style="font-weight: bold;">试卷知识点分析</span>
            <el-icon><component :is="showChart ? 'ArrowUp' : 'ArrowDown'" /></el-icon>
          </div>
          
          <div v-show="showChart" style="border: 1px solid #ebeef5; border-top: none; padding: 20px; background: white; display: flex; flex-direction: column;">
            <div style="margin-bottom: 20px; padding: 15px; background: #fdfdfd; border: 1px solid #ebeef5; border-radius: 4px;">
              <el-row :gutter="20">
                <el-col :span="12">
                  <div style="font-weight: bold; margin-bottom: 10px;">
                    知识点覆盖度：<span style="color: #409EFF">{{ pointCoverage }}</span>
                  </div>
                  <div style="font-size: 14px; color: #606266; margin-bottom: 10px;">
                    <span style="font-weight: bold;">未包含的知识点：</span>
                    <span v-if="uncoveredPoints.length === 0">无</span>
                    <span v-else>{{ uncoveredPoints.join('、') }}</span>
                  </div>
                </el-col>
                <el-col :span="12">
                  <div style="font-weight: bold; margin-bottom: 10px;">
                    试卷难度：<span style="color: #E6A23C">{{ paperLevel }}</span>
                  </div>
                  <div style="font-weight: bold;">
                    试卷相似度：<span style="color: #67C23A">{{ paperRepeatability }}</span>
                  </div>
                </el-col>
              </el-row>
            </div>
            <div style="display: flex; width: 100%;">
              <div id="handAnalysisChart" style="width: 50%; height: 400px;"></div>
              <div id="handLevelChart" style="width: 50%; height: 400px;"></div>
            </div>
          </div>
        </div>

        <div class="paper-content">
          <div style="text-align: center; margin-bottom: 20px;">
            <h2>{{ form.paperName || '未命名试卷' }}</h2>
            <div style="margin-top: 10px; font-size: 16px; font-weight: bold;">
              (总分: {{ totalScore }}分)
            </div>
          </div>

          <!-- 单选题 -->
          <div v-if="choiceList.length > 0">
            <h4>一、单选题(每题{{form.choiceScore}}分)</h4>
            <div v-for="(choice, index) in choiceList" :key="index" class="question-container" :class="{'highlight-question': activePoint === choice.questionPoint || activeLevel === choice.questionLevel}" :style="getHighlightColor(choice.questionPoint, choice.questionLevel)">
              <div class="leader-line" v-if="activePoint === choice.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
              </div>
              <div class="leader-line" v-if="activeLevel === choice.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
              </div>
              <div style="display: flex; justify-content: space-between;">
                <span class="cho">{{index+1}}.{{ choice.questionSubject}}</span>
                <el-button type="danger" size="small" @click="removeQuestion(choice)" plain>删除</el-button>
              </div>
              
              <table style="width: 100%; border: none; margin-top: 10px;">
                <tr>
                  <td style="vertical-align: top;">
                    <span class="opt">A. {{ choice.optionA }}</span><br/>
                    <span class="opt">B. {{ choice.optionB }}</span><br/>
                    <span class="opt">C. {{ choice.optionC }}</span><br/>
                    <span class="opt">D. {{ choice.optionD }}</span><br/>
                  </td>
                  <td v-if="choice.questionImage" style="vertical-align: top; text-align: right; width: 200px;">
                    <img :src="choice.questionImage" alt="题目图片" class="question-image"/>
                  </td>
                </tr>
              </table>
            </div>
            <br/>
          </div>

          <!-- 多选题 -->
          <div v-if="multiList.length > 0">
            <h4>二、多选题(每题{{form.multiScore}}分)</h4>
            <div v-for="(multi, index) in multiList" :key="index" class="question-container" :class="{'highlight-question': activePoint === multi.questionPoint || activeLevel === multi.questionLevel}" :style="getHighlightColor(multi.questionPoint, multi.questionLevel)">
              <div class="leader-line" v-if="activePoint === multi.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
              </div>
              <div class="leader-line" v-if="activeLevel === multi.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
              </div>
              <div style="display: flex; justify-content: space-between;">
                <span class="cho">{{index+1}}.{{ multi.questionSubject }}</span>
                <el-button type="danger" size="small" @click="removeQuestion(multi)" plain>删除</el-button>
              </div>
              
              <table style="width: 100%; border: none; margin-top: 10px;">
                <tr>
                  <td style="vertical-align: top;">
                    <span class="opt">A. {{ multi.optionA }}</span><br/>
                    <span class="opt">B. {{ multi.optionB }}</span><br/>
                    <span class="opt">C. {{ multi.optionC }}</span><br/>
                    <span class="opt">D. {{ multi.optionD }}</span><br/>
                  </td>
                  <td v-if="multi.questionImage" style="vertical-align: top; text-align: right; width: 200px;">
                    <img :src="multi.questionImage" alt="题目图片" class="question-image"/>
                  </td>
                </tr>
              </table>
            </div>
            <br/>
          </div>

          <!-- 填空题 -->
          <div v-if="blankList.length > 0">
            <h4>三、填空题(每题{{form.blankFillingScore}}分)</h4>
            <div v-for="(blank, index) in blankList" :key="index" class="question-container" :class="{'highlight-question': activePoint === blank.questionPoint || activeLevel === blank.questionLevel}" :style="getHighlightColor(blank.questionPoint, blank.questionLevel)">
              <div class="leader-line" v-if="activePoint === blank.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
              </div>
              <div class="leader-line" v-if="activeLevel === blank.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
              </div>
              <div style="display: flex; justify-content: space-between;">
                <span class="cho">{{index+1}}.{{ blank.questionSubject }}</span>
                <el-button type="danger" size="small" @click="removeQuestion(blank)" plain>删除</el-button>
              </div>
              <div v-if="blank.questionImage" class="img-container">
                <img :src="blank.questionImage" alt="题目图片" class="question-image"/>
              </div>
            </div>
            <br/>
          </div>

          <!-- 判断题 -->
          <div v-if="judgeList.length > 0">
            <h4>四、判断题(每题{{form.judgeScore}}分)</h4>
            <div v-for="(judge, index) in judgeList" :key="index" class="question-container" :class="{'highlight-question': activePoint === judge.questionPoint || activeLevel === judge.questionLevel}" :style="getHighlightColor(judge.questionPoint, judge.questionLevel)">
              <div class="leader-line" v-if="activePoint === judge.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
              </div>
              <div class="leader-line" v-if="activeLevel === judge.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
              </div>
              <div style="display: flex; justify-content: space-between;">
                <span class="cho">{{index+1}}.{{ judge.questionSubject }}</span>
                <el-button type="danger" size="small" @click="removeQuestion(judge)" plain>删除</el-button>
              </div>
              <div v-if="judge.questionImage" class="img-container">
                <img :src="judge.questionImage" alt="题目图片" class="question-image"/>
              </div>
            </div>
            <br/>
          </div>

          <!-- 简答题 -->
          <div v-if="shortList.length > 0">
            <h4>五、问答题(每题{{form.shortScore}}分)</h4>
            <div v-for="(short, index) in shortList" :key="index" class="question-container" :class="{'highlight-question': activePoint === short.questionPoint || activeLevel === short.questionLevel}" :style="getHighlightColor(short.questionPoint, short.questionLevel)">
              <div class="leader-line" v-if="activePoint === short.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
              </div>
              <div class="leader-line" v-if="activeLevel === short.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
              </div>
              <div style="display: flex; justify-content: space-between;">
                <span class="cho">{{index+1}}.{{ short.questionSubject }}</span>
                <el-button type="danger" size="small" @click="removeQuestion(short)" plain>删除</el-button>
              </div>
              <div v-if="short.questionImage" class="img-container">
                <img :src="short.questionImage" alt="题目图片" class="question-image"/>
              </div>
            </div>
            <br/>
          </div>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
// @ is an alias to /src

import request from "@/utils/request";
import * as echarts from 'echarts';
import { ArrowUp, ArrowDown } from '@element-plus/icons-vue'

export default {
  name: 'HandPaper',
  components: {
    ArrowUp,
    ArrowDown
  },
  data(){
    return {

      questionType:'单选题',
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
      formLabelWidth :'100px',
      showChoiceTable:true,
      showTable:false,

      tableData: [],
      dataList:[],
      dataBankList:[],
      dataPointList:[],
      ids:[],
      questions:'',
      
      visibleColumns: [
        'questionId', 'questionType', 'questionLevel', 'courseType', 
        'questionPoint', 'questionSubject', 'optionA', 'optionB', 
        'optionC', 'optionD'
      ],

      form:{
        paperName: '',
        courseName: '',
        choiceQuestion:'',
        choiceScore: 0,
        multiQuestion: '',
        multiScore: 0,
        blankFillingQuestion: '',
        blankFillingScore: 0,
        judgeQuestion: '',
        judgeScore: 0,
        shortQuestion: '',
        shortScore: 0
      },
      
      scoreError: {
        choice: false,
        multi: false,
        blank: false,
        judge: false,
        short: false
      },
      
      addedQuestions: [],
      isEditMode: false,
      
      showChart: true,
      chartInstance: null,
      levelChartInstance: null,
      activePoint: '',
      activeLevel: '',
      colorMap: {}, // 存储扇区颜色
      levelColorMap: {}, // 存储难度扇区颜色
      recentPaperList: []
    }
  },
  created() {
    this.load();
    this.getCourseName();
    this.getBankName();
    
    // 检查是否是编辑模式
    const paperStr = this.$route.query.paper;
    if (paperStr) {
      this.isEditMode = true;
      const paper = JSON.parse(paperStr);
      this.initEditData(paper);
    }
  },
  computed: {
    totalScore() {
      return this.addedQuestions.reduce((sum, q) => {
        return sum + this.getScoreByType(q.questionType);
      }, 0);
    },
    choiceList() {
      return this.addedQuestions.filter(q => q.questionType === '单选题');
    },
    multiList() {
      return this.addedQuestions.filter(q => q.questionType === '多选题');
    },
    blankList() {
      return this.addedQuestions.filter(q => q.questionType === '填空题');
    },
    judgeList() {
      return this.addedQuestions.filter(q => q.questionType === '判断题');
    },
    shortList() {
      return this.addedQuestions.filter(q => q.questionType === '简答题');
    },
    analysisCourseName() {
      if (this.addedQuestions.length > 0 && this.addedQuestions[0].courseType) {
        return this.addedQuestions[0].courseType;
      }
      if (this.form.courseName) {
        return this.form.courseName;
      }
      return '';
    },
    pointCoverage() {
      if (!this.dataPointList || this.dataPointList.length === 0) return 0;
      const coveredPoints = new Set(this.addedQuestions.map(q => q.questionPoint).filter(Boolean));
      return Number((coveredPoints.size / this.dataPointList.length).toFixed(2));
    },
    uncoveredPoints() {
      if (!this.dataPointList || this.dataPointList.length === 0) return [];
      const coveredPoints = new Set(this.addedQuestions.map(q => q.questionPoint).filter(Boolean));
      return this.dataPointList.filter(point => !coveredPoints.has(point));
    },
    paperLevel() {
      if (this.totalScore === 0) return 0;
      let difficulty = 0;
      this.addedQuestions.forEach(question => {
        difficulty += this.getDifficultyNum(question.questionLevel) * this.getScoreByType(question.questionType);
      });
      return Number((difficulty / this.totalScore).toFixed(2));
    },
    paperRepeatability() {
      const selectedIds = this.getCurrentQuestionIds();
      if (selectedIds.length === 0) return 0;
      const basePapers = this.recentPaperList
        .filter(p => !this.form.paperId || p.paperId !== this.form.paperId)
        .sort((a, b) => b.paperId - a.paperId)
        .slice(0, 2);
      if (basePapers.length < 2) return 0;
      const paperAIds = this.parsePaperQuestionIds(basePapers[0]);
      const paperBIds = this.parsePaperQuestionIds(basePapers[1]);
      return Number(this.calculateCommonElementsRatio(selectedIds, paperAIds, paperBIds).toFixed(2));
    }
  },
  watch:{
    addedQuestions: {
      handler() {
        this.$nextTick(() => {
          this.initChart();
        });
      },
      deep: true
    },
    analysisCourseName: {
      handler(val) {
        if (!val) {
          this.dataPointList = [];
          this.recentPaperList = [];
          return;
        }
        this.getPointName(val);
        this.getRecentPapers(val);
      },
      immediate: true
    },
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
    getDifficultyNum(level) {
      if (level === '容易') return 1.0;
      if (level === '较易') return 2.0;
      if (level === '中等') return 3.0;
      if (level === '较难') return 4.0;
      return 5.0;
    },
    getCurrentQuestionIds() {
      return this.addedQuestions
        .map(item => Number(item.questionId))
        .filter(item => !Number.isNaN(item));
    },
    parsePaperQuestionIds(paper) {
      const group = [
        paper.choiceQuestion,
        paper.multiQuestion,
        paper.blankFillingQuestion,
        paper.judgeQuestion,
        paper.shortQuestion
      ]
        .filter(Boolean)
        .join(',');
      if (!group) return [];
      return group
        .split(',')
        .map(item => Number(item))
        .filter(item => !Number.isNaN(item));
    },
    calculateCommonElementsRatio(arrayA, arrayB, arrayC) {
      const uniqueElements = new Set(arrayA);
      let duplicateCount = 0;
      arrayB.forEach(num => {
        if (uniqueElements.has(num)) {
          duplicateCount += 1;
        }
      });
      arrayC.forEach(num => {
        if (uniqueElements.has(num)) {
          duplicateCount += 1;
        }
      });
      const totalElements = arrayA.length + arrayB.length + arrayC.length;
      if (totalElements === 0) return 0;
      return duplicateCount / totalElements;
    },

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
    
    // 获取题目类型对应的分数
    getScoreByType(type) {
      switch(type) {
        case '单选题': return this.form.choiceScore || 0;
        case '多选题': return this.form.multiScore || 0;
        case '填空题': return this.form.blankFillingScore || 0;
        case '判断题': return this.form.judgeScore || 0;
        case '简答题': return this.form.shortScore || 0;
        default: return 0;
      }
    },
    
    // 重置所有错误状态
    resetScoreErrors() {
      this.scoreError = {
        choice: false,
        multi: false,
        blank: false,
        judge: false,
        short: false
      };
    },

    // 检查试题是否已在试卷中
    isInPaper(row) {
      return this.addedQuestions.some(q => q.questionId === row.questionId);
    },

    // 加入试卷
    addQuestionToPaper(row) {
      this.resetScoreErrors();
      let score = 0;
      let errorKey = '';
      
      switch(row.questionType) {
        case '单选题': 
          score = this.form.choiceScore; 
          errorKey = 'choice';
          break;
        case '多选题': 
          score = this.form.multiScore; 
          errorKey = 'multi';
          break;
        case '填空题': 
          score = this.form.blankFillingScore; 
          errorKey = 'blank';
          break;
        case '判断题': 
          score = this.form.judgeScore; 
          errorKey = 'judge';
          break;
        case '简答题': 
          score = this.form.shortScore; 
          errorKey = 'short';
          break;
      }
      
      // 检查分数是否设置
      if (!score || score <= 0) {
        this.$message.error(`未设置${row.questionType}分数！`);
        this.scoreError[errorKey] = true;
        return;
      }
      
      this.addedQuestions.push(row);
      this.$message.success("添加成功");
    },
    
    // 从试卷中移除
    removeQuestion(row) {
      this.addedQuestions = this.addedQuestions.filter(q => q.questionId !== row.questionId);
    },

    // 初始化编辑数据
    initEditData(paper) {
      this.form = { ...paper };
      
      // 加载所有题目的详情
      const types = [
        { ids: paper.choiceQuestion, type: '单选题' },
        { ids: paper.multiQuestion, type: '多选题' },
        { ids: paper.blankFillingQuestion, type: '填空题' },
        { ids: paper.judgeQuestion, type: '判断题' },
        { ids: paper.shortQuestion, type: '简答题' }
      ];

      types.forEach(item => {
        if (item.ids && item.ids.length > 0) {
          request.get("/question/getQuestions", {
            params: { str: item.ids }
          }).then(res => {
            if (res.code === 0 && res.data) {
              this.addedQuestions.push(...res.data);
            }
          });
        }
      });
    },

    // 初始化或更新图表
    initChart() {
      if (!this.showChart) return;
      
      const chartDom = document.getElementById('handAnalysisChart');
      const levelChartDom = document.getElementById('handLevelChart');
      
      if (!chartDom || !levelChartDom) return;
      
      let data = this.addedQuestions;
      
      if (data.length === 0) return;
      
      // --- 知识点图表 ---
      if (this.chartInstance) this.chartInstance.dispose();
      this.chartInstance = echarts.init(chartDom);
      
      // 按知识点统计
      const resultPoint = Object.entries(data.reduce((acc, cur) => {
        const count = acc[cur.questionPoint] || 0;
        return {...acc, [cur.questionPoint]: count + 1};
      }, {})).map(([name, value]) => ({name, value}));
      
      const pointOption = {
        title: {
          text: '知识点分布',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          orient: 'vertical',
          left: 'left'
        },
        series: [
          {
            name: '知识点',
            type: 'pie',
            radius: '50%',
            data: resultPoint,
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              },
              scale: true,
              scaleSize: 15
            },
            selectedMode: 'single',
            select: { itemStyle: {} }
          }
        ]
      };
      
      this.chartInstance.setOption(pointOption);
      
      this.chartInstance.on('click', (params) => {
        // 清除另一个图表的选中状态
        this.activeLevel = '';
        if (this.levelChartInstance) {
          this.levelChartInstance.dispatchAction({ type: 'downplay', seriesIndex: 0 });
          this.levelChartInstance.dispatchAction({ type: 'unselect', seriesIndex: 0 });
        }

        if (this.activePoint === params.name) {
             this.activePoint = '';
             this.chartInstance.dispatchAction({ type: 'downplay', seriesIndex: 0, dataIndex: params.dataIndex });
             this.chartInstance.dispatchAction({ type: 'unselect', seriesIndex: 0, dataIndex: params.dataIndex });
        } else {
             this.activePoint = params.name;
             this.colorMap[params.name] = params.color;
             this.chartInstance.dispatchAction({ type: 'select', seriesIndex: 0, name: params.name });
        }
      });
      
      this.chartInstance.getZr().on('click', (params) => {
        if (!params.target) {
          this.activePoint = '';
          this.chartInstance.dispatchAction({ type: 'unselect', seriesIndex: 0 });
        }
      });

      // --- 难度图表 ---
      if (this.levelChartInstance) this.levelChartInstance.dispose();
      this.levelChartInstance = echarts.init(levelChartDom);

      // 按难度统计
      const resultLevel = Object.entries(data.reduce((acc, cur) => {
        const count = acc[cur.questionLevel] || 0;
        return {...acc, [cur.questionLevel]: count + 1};
      }, {})).map(([name, value]) => ({name, value}));

      const levelOption = {
        title: {
          text: '难度分布',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          orient: 'vertical',
          left: 'left'
        },
        series: [
          {
            name: '难度',
            type: 'pie',
            radius: '50%',
            data: resultLevel,
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              },
              scale: true,
              scaleSize: 15
            },
            selectedMode: 'single',
            select: { itemStyle: {} }
          }
        ]
      };

      this.levelChartInstance.setOption(levelOption);

      this.levelChartInstance.on('click', (params) => {
        // 清除另一个图表的选中状态
        this.activePoint = '';
        if (this.chartInstance) {
          this.chartInstance.dispatchAction({ type: 'downplay', seriesIndex: 0 });
          this.chartInstance.dispatchAction({ type: 'unselect', seriesIndex: 0 });
        }

        if (this.activeLevel === params.name) {
             this.activeLevel = '';
             this.levelChartInstance.dispatchAction({ type: 'downplay', seriesIndex: 0, dataIndex: params.dataIndex });
             this.levelChartInstance.dispatchAction({ type: 'unselect', seriesIndex: 0, dataIndex: params.dataIndex });
        } else {
             this.activeLevel = params.name;
             this.levelColorMap[params.name] = params.color;
             this.levelChartInstance.dispatchAction({ type: 'select', seriesIndex: 0, name: params.name });
        }
      });

      this.levelChartInstance.getZr().on('click', (params) => {
        if (!params.target) {
          this.activeLevel = '';
          this.levelChartInstance.dispatchAction({ type: 'unselect', seriesIndex: 0 });
        }
      });
    },
    
    toggleChart() {
      this.showChart = !this.showChart;
      if (this.showChart) {
        this.$nextTick(() => {
          this.initChart();
        });
      }
    },

    // 辅助方法：计算背景色（带有透明度）
    getHighlightColor(point, level) {
      let color = '';
      if (point && this.colorMap[point] && this.activePoint === point) {
        color = this.colorMap[point];
      } else if (level && this.levelColorMap[level] && this.activeLevel === level) {
        color = this.levelColorMap[level];
      }
      
      if (!color) return {};
      
      // 假设 color 是 hex 格式，转换为 rgba 以增加透明度
      if (color.startsWith('#')) {
        let r = parseInt(color.slice(1, 3), 16);
        let g = parseInt(color.slice(3, 5), 16);
        let b = parseInt(color.slice(5, 7), 16);
        return { backgroundColor: `rgba(${r}, ${g}, ${b}, 0.1)` };
      }
      return { backgroundColor: color, opacity: 0.1 }; 
    },

    createPaper() {
      // 组装ids
      const choiceIds = this.addedQuestions.filter(q => q.questionType === '单选题').map(q => q.questionId).join(',');
      const multiIds = this.addedQuestions.filter(q => q.questionType === '多选题').map(q => q.questionId).join(',');
      const blankIds = this.addedQuestions.filter(q => q.questionType === '填空题').map(q => q.questionId).join(',');
      const judgeIds = this.addedQuestions.filter(q => q.questionType === '判断题').map(q => q.questionId).join(',');
      const shortIds = this.addedQuestions.filter(q => q.questionType === '简答题').map(q => q.questionId).join(',');
      
      this.form.choiceQuestion = choiceIds;
      this.form.multiQuestion = multiIds;
      this.form.blankFillingQuestion = blankIds;
      this.form.judgeQuestion = judgeIds;
      this.form.shortQuestion = shortIds;
      
      if (this.addedQuestions.length === 0) {
        this.$message.warning("请先添加试题！");
        return;
      }
      
      if (!this.form.paperName) {
        this.$message.warning("请输入试卷名称！");
        return;
      }

      // 如果需要课程名称，可以根据题目自动推断或者设为默认值，或者直接去掉这个字段
      // 这里为了兼容后端接口，可以设为第一个题目的课程类型或者空字符串
      if (this.addedQuestions.length > 0) {
        this.form.courseName = this.addedQuestions[0].courseType || '公共课程';
      }

      console.log(this.form);
      
      if (this.isEditMode) {
        // 更新模式
        request.put('/paper', this.form).then(res => {
          if (res.code == 0) {
            this.$message.success("更新成功");
            this.$router.push('/teacherPaper'); // 更新成功后返回试卷列表
          } else {
            this.$message.error(res.msg);
          }
        }).catch(error => {
          console.error(error);
        });
      } else {
        // 创建模式
        request.post('/paper/save', this.form).then(res => {
          if (res.code == 0) {
            this.$message.success(res.msg);
            // 清空
            this.addedQuestions = [];
            this.form.paperName = '';
            this.form.courseName = '';
            this.resetScoreErrors();
          } else {
            this.$message.error(res.msg);
          }
        }).catch(error => {
          console.error(error);
        });
      }
    },

      //分页
    handleSizeChange(){
      this.load();
    },
    handleCurrentChange(){
      this.load();
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
    getPointName(courseType){
      if (!courseType) return;
      request.get("/point/getPointName",{ params: {
          courseType: courseType
        }}).then(res=>{
        this.dataPointList=res.data;
      })
    },
    getRecentPapers(courseType) {
      if (!courseType) return;
      request.get("/paper/queryPaper", {
        params: {
          pageNum: 1,
          pageSize: 200,
          courseType: courseType,
          paperName: ''
        }
      }).then(res => {
        this.recentPaperList = res.data?.records || [];
      })
    }
  },
}

</script>

<style scoped>
.is-error :deep(.el-input__wrapper) {
  box-shadow: 0 0 0 1px #f56c6c inset !important;
}
.paper-preview {
  margin-top: 20px;
  padding: 20px;
  border: 1px solid #ebeef5;
  border-radius: 4px;
}
.paper-content {
  margin-left: 10%;
  width: 80%;
  background: #fff;
  padding: 30px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
}
.cho{
  margin-left: 20px;
  font-size: 16px;
}
.opt{
  margin-left: 40px;
  line-height: 1.8;
}
.question-container {
  position: relative;
  min-height: 50px;
  margin-bottom: 15px;
  padding: 10px;
}
.question-container:hover {
  background-color: #f5f7fa;
  border-radius: 4px;
}
.img-container {
  display: flex;
  justify-content: flex-end;
  margin-right: 20px;
  margin-top: 10px;
  margin-bottom: 10px;
}
.question-image {
  max-width: 100%;
  max-height: 300px;
  object-fit: contain;
}
.highlight-question {
  /* background-color: #f0f9eb !important;  移除固定背景色，改用动态内联样式 */
  border: 2px solid transparent;
  border-radius: 8px;
  transition: all 0.3s;
  padding: 10px;
}
.leader-line {
  position: absolute;
  right: -20px;
  top: 10px;
  bottom: 10px;
  width: 4px;
  border-right: 4px solid #409EFF;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.leader-label {
  position: absolute;
  right: -120px;
  top: 0;
  background-color: #409EFF;
  color: white;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
  width: 100px;
  text-align: left;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
.leader-label::after {
  content: '';
  position: absolute;
  left: -4px;
  top: 50%;
  transform: translateY(-50%);
  border-top: 4px solid transparent;
  border-bottom: 4px solid transparent;
  border-right: 4px solid inherit;
  filter: brightness(0.9);
}
</style>

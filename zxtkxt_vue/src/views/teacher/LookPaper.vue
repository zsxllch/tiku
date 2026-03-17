<template>
  <div id="main">
    
    <!-- 分析图表区域 -->
    <div style="width: 80%; margin: 0 auto 20px;">
      <div style="cursor: pointer; padding: 10px; background: #f5f7fa; border-radius: 4px; display: flex; justify-content: space-between; align-items: center;" @click="toggleChart">
        <span style="font-weight: bold;">试卷知识点分析</span>
        <el-icon><component :is="showChart ? 'ArrowUp' : 'ArrowDown'" /></el-icon>
      </div>
      
      <div v-show="showChart" style="border: 1px solid #ebeef5; border-top: none; padding: 20px; background: white; display: flex;">
        <div id="analysisChart" style="width: 50%; height: 400px;"></div>
        <div id="levelChart" style="width: 50%; height: 400px;"></div>
      </div>
    </div>

    <!-- 这里就是要变成图片的容器 -->
    <div id="pdfHtml" ref="printHtml" style="margin-left: 100px; width: 70%;">
        <div style="margin-left:300px;">
          <h2>{{paper.paperName}}</h2>
        </div>
        <div style="text-align: center; margin-top: 10px; margin-bottom: 20px; font-size: 16px; font-weight: bold;">
          (总分: {{ totalScore }}分)
        </div>
        <div>
          <h4>一、单选题(每题{{paper.choiceScore}}分)</h4>
          <div v-for="(choice, index) in choiceList" :key="index" class="question-container" :class="{'highlight-question': activePoint === choice.questionPoint || activeLevel === choice.questionLevel}" :style="getHighlightColor(choice.questionPoint, choice.questionLevel)">
            <div class="leader-line" v-if="activePoint === choice.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
            </div>
            <div class="leader-line" v-if="activeLevel === choice.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
            </div>
            <span class="cho">{{index+1}}.{{ choice.questionSubject}}</span><br/>
            
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

        <div>
          <h4>二、多选题(每题{{paper.multiScore}}分)</h4>
          <div v-for="(multi, index) in multiList" :key="index" class="question-container" :class="{'highlight-question': activePoint === multi.questionPoint || activeLevel === multi.questionLevel}" :style="getHighlightColor(multi.questionPoint, multi.questionLevel)">
            <div class="leader-line" v-if="activePoint === multi.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
            </div>
            <div class="leader-line" v-if="activeLevel === multi.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
            </div>
            <span class="cho">{{index+1}}.{{ multi.questionSubject }}</span><br/>
            
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
        <div>
          <h4>三、填空题(每题{{paper.blankFillingScore}}分)</h4>
          <div v-for="(blank, index) in blankList" :key="index" class="question-container" :class="{'highlight-question': activePoint === blank.questionPoint || activeLevel === blank.questionLevel}" :style="getHighlightColor(blank.questionPoint, blank.questionLevel)">
            <div class="leader-line" v-if="activePoint === blank.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
            </div>
            <div class="leader-line" v-if="activeLevel === blank.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
            </div>
            <span class="cho">{{index+1}}.{{ blank.questionSubject }}</span><br/>
            <div v-if="blank.questionImage" class="img-container">
              <img :src="blank.questionImage" alt="题目图片" class="question-image"/>
            </div>
          </div>
          <br/>
        </div>
        <div>
          <h4>四、判断题(每题{{paper.judgeScore}}分)</h4>
          <div v-for="(judge, index) in judgeList" :key="index" class="question-container" :class="{'highlight-question': activePoint === judge.questionPoint || activeLevel === judge.questionLevel}" :style="getHighlightColor(judge.questionPoint, judge.questionLevel)">
            <div class="leader-line" v-if="activePoint === judge.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
            </div>
            <div class="leader-line" v-if="activeLevel === judge.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
            </div>
            <span class="cho">{{index+1}}.{{ judge.questionSubject }}</span><br/>
            <div v-if="judge.questionImage" class="img-container">
              <img :src="judge.questionImage" alt="题目图片" class="question-image"/>
            </div>
          </div>
          <br/>
        </div>
        <div>
          <h4>五、问答题(每题{{paper.shortScore}}分)</h4>
          <div v-for="(short, index) in shortList" :key="index" class="question-container" :class="{'highlight-question': activePoint === short.questionPoint || activeLevel === short.questionLevel}" :style="getHighlightColor(short.questionPoint, short.questionLevel)">
            <div class="leader-line" v-if="activePoint === short.questionPoint" :style="{ borderColor: colorMap[activePoint] }">
                <span class="leader-label" :style="{ backgroundColor: colorMap[activePoint] }">{{ activePoint }}</span>
            </div>
            <div class="leader-line" v-if="activeLevel === short.questionLevel" :style="{ borderColor: levelColorMap[activeLevel] }">
                <span class="leader-label" :style="{ backgroundColor: levelColorMap[activeLevel] }">{{ activeLevel }}</span>
            </div>
            <span class="cho">{{index+1}}.{{ short.questionSubject }}</span><br/>
            <div v-if="short.questionImage" class="img-container">
              <img :src="short.questionImage" alt="题目图片" class="question-image"/>
            </div>
          </div>
          <br/>
        </div>
    </div>
    <el-button type="primary" @click="exportDocx" style="margin-left: 200px" plain>导出Word</el-button>
    <el-button type="primary" @click="lookAnswers" style="margin-left: 100px" plain>查看答案</el-button>
    <el-button type="primary"  style="margin-left: 100px" @click="analyse" plain> 试卷分析</el-button>
  </div>

</template>

<script>
import request from "@/utils/request";
import {getPdf} from "@/utils/exportPdf";
import * as echarts from 'echarts';
import { ArrowUp, ArrowDown } from '@element-plus/icons-vue'

export default {
  name:'LookPaper',
  components: {
    ArrowUp,
    ArrowDown
  },

  data() {
    return {
      paper:{
        paperName:'',
        choiceQuestion:'',
        multiQuestion:'',
        blankFillingQuestion:'',
        judgeQuestion:'',
        shortQuestion:'',
        choiceScore:'',
        multiScore:'',
        blankFillingScore:'',
        judgeScore:'',
        shortScore:''
      },
      choiceList:[],
      multiList:[],
      blankList:[],
      judgeList:[],
      shortList:[],
      
      showChart: true,
      chartInstance: null,
      levelChartInstance: null,
      activePoint: '',
      activeLevel: '',
      colorMap: {}, // 存储扇区颜色
      levelColorMap: {}, // 存储难度扇区颜色
    }
  },
  computed: {
    totalScore() {
      let score = 0;
      if (this.choiceList && this.choiceList.length > 0) score += this.choiceList.length * (this.paper.choiceScore || 0);
      if (this.multiList && this.multiList.length > 0) score += this.multiList.length * (this.paper.multiScore || 0);
      if (this.blankList && this.blankList.length > 0) score += this.blankList.length * (this.paper.blankFillingScore || 0);
      if (this.judgeList && this.judgeList.length > 0) score += this.judgeList.length * (this.paper.judgeScore || 0);
      if (this.shortList && this.shortList.length > 0) score += this.shortList.length * (this.paper.shortScore || 0);
      return score;
    }
  },
  created() {
    this.paper=JSON.parse(this.$route.query.paper);
    // alert(this.paper.paperName);
    this.getChoiceQuestion();
    this.getMultiQuestion();
    this.getBlankFillingQuestion();
    this.getJudgeQuestion();
    this.getShortQuestion();
    // 延迟初始化图表，确保数据已加载（简单处理，理想情况是用 Promise.all）
    setTimeout(() => {
        this.initChart();
    }, 1000);
  },
  methods:{
    getChoiceQuestion(){
      request.get("/question/getQuestions",{
        params:{
          str: this.paper.choiceQuestion
        }
      }).then(res=>{
        this.choiceList=res.data;
        // console.log(this.choiceList)
      })
    },
    getMultiQuestion(){
      request.get("/question/getQuestions",{
        params:{
          str: this.paper.multiQuestion
        }
      }).then(res=>{
        this.multiList=res.data;
      })
    },
    getBlankFillingQuestion(){
      request.get("/question/getQuestions",{
        params:{
          str: this.paper.blankFillingQuestion
        }
      }).then(res=>{
        this.blankList=res.data;
        console.log(this.choiceList);
      })
    },
    getJudgeQuestion(){
      request.get("/question/getQuestions",{
        params:{
          str: this.paper.judgeQuestion
        }
      }).then(res=>{
        this.judgeList=res.data;
      })
    },
    getShortQuestion(){
      request.get("/question/getQuestions",{
        params:{
          str: this.paper.shortQuestion
        }
      }).then(res=>{
        this.shortList=res.data;
      })
    },
    // 导出DOCX
    exportDocx() {
      // 导出前先隐藏不需要的按钮或元素
      const originalHtml = this.$refs.printHtml.innerHTML;
      
      // 可以对导出的内容做一些预处理，比如将图片的src转换为base64（如果需要），或者调整样式
      // 这里直接导出当前显示的HTML
      
      import("@/utils/exportDocx").then(({ getDocx }) => {
        getDocx(this.paper.paperName, 'pdfHtml');
      });
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

    // 试卷分析
    analyse(){
      let data = this.choiceList.concat(this.multiList, this.blankList,this.judgeList,this.shortList);
      console.log(data);

      const resultPoint = Object.entries(data.reduce((acc, cur) => {
        const count = acc[cur.questionPoint] || 0;
        return {...acc, [cur.questionPoint]: count + 1};
      }, {})).map(([name, value]) => ({name, value}));

      const resultLevel = Object.entries(data.reduce((acc, cur) => {
        const count = acc[cur.questionLevel] || 0;
        return {...acc, [cur.questionLevel]: count + 1};
      }, {})).map(([name, value]) => ({name, value}));
      // 跳转到目标页面并带上参数
      this.$router.push({ path: '/analysePaper', query: { data:JSON.stringify({'resultPoint':resultPoint,'resultLevel':resultLevel,'paper':this.paper})}  });
    },
    
    // 初始化或更新图表
    initChart() {
      if (!this.showChart) return;
      
      const chartDom = document.getElementById('analysisChart');
      const levelChartDom = document.getElementById('levelChart');
      
      if (!chartDom || !levelChartDom) return;
      
      // 聚合所有题目数据
      let data = [
        ...this.choiceList, 
        ...this.multiList, 
        ...this.blankList, 
        ...this.judgeList, 
        ...this.shortList
      ];
      
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

    lookAnswers(){
      // 跳转到目标页面并带上参数
      this.$router.push({ path: '/lookAnswers', query: {
        data:JSON.stringify(
          {'choiceList':this.choiceList,'multiList':this.multiList,'blankList':this.blankList,'judgeList':this.judgeList,'shortList':this.shortList}
        )}
      });

    }

  }
}
</script>
<style>
.cho{
  margin-left: 20px;
}
.opt{
  margin-left: 40px;
}
.question-container {
  position: relative;
  min-height: 50px;
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
  /* background-color: #f0f9eb;  移除固定背景色，改用动态内联样式 */
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
  border-right: 4px solid #409EFF; /* 默认颜色，会被动态样式覆盖 */
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.leader-label {
  position: absolute;
  right: -120px;
  top: 0;
  background-color: #409EFF; /* 默认颜色 */
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
  border-right: 4px solid inherit; /* 继承父元素背景色 */
  filter: brightness(0.9); /*稍微变暗一点*/
}
#main{

}

</style>

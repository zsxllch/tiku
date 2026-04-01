package com.example.zxtkxt.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.zxtkxt.core.api.ApiRest;
import com.example.zxtkxt.core.api.controller.BaseController;
import com.example.zxtkxt.mapper.QuestionBankMapper;
import com.example.zxtkxt.pojo.Course;
import com.example.zxtkxt.pojo.Question;
import com.example.zxtkxt.pojo.QuestionBank;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/bank")
public class QuestionBankController extends BaseController {

    @Autowired
    private QuestionBankMapper questionBankMapper;
    
    @Autowired
    private com.example.zxtkxt.mapper.QuestionMapper questionMapper;

    @Autowired
    private HttpServletRequest request;

    /**
     * 题库分页列表查询
     *
     * @param pageNum
     * @param pageSize
     * @param search
     * @return
     */
    @GetMapping("/queryQuestionBank")
    public ApiRest<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                               @RequestParam(defaultValue = "10") Integer pageSize,
                               @RequestParam(defaultValue = "" ) String search) {
        LambdaQueryWrapper<QuestionBank> wrapper = Wrappers.<QuestionBank>lambdaQuery().orderByAsc(QuestionBank::getBankId);
        if (StrUtil.isNotBlank(search)) {
            wrapper.like(QuestionBank::getBankName, search);
        }

        Page<QuestionBank> userPage = questionBankMapper.selectPage(new Page<>(pageNum, pageSize), wrapper);
        
        // 动态统计各个题库的题目数量
        for (QuestionBank bank : userPage.getRecords()) {
            LambdaQueryWrapper<Question> qWrapper = Wrappers.lambdaQuery();
            qWrapper.eq(Question::getBankName, bank.getBankName());
            List<Question> questions = questionMapper.selectList(qWrapper);
            
            int choice = 0, multi = 0, blank = 0, judge = 0, shortQ = 0;
            for (Question q : questions) {
                if ("单选题".equals(q.getQuestionType())) choice++;
                else if ("多选题".equals(q.getQuestionType())) multi++;
                else if ("填空题".equals(q.getQuestionType())) blank++;
                else if ("判断题".equals(q.getQuestionType())) judge++;
                else if ("简答题".equals(q.getQuestionType())) shortQ++;
            }
            bank.setChoiceCount(choice);
            bank.setMultiCount(multi);
            bank.setBlankFillingCount(blank);
            bank.setJudgeCount(judge);
            bank.setShortCount(shortQ);
        }
        
        return success(userPage);
    }

    /**
     * 删除题库
     * @return
     */
    @ApiOperation(value = "删除用户")
    @DeleteMapping("/{id}")
    public ApiRest<String> delete(@PathVariable Long id) {
        try {
            QuestionBank bank = questionBankMapper.selectById(id);
            if (bank == null) {
                return failure("题库不存在");
            }
            String userName = (String) request.getSession().getAttribute("userName");
            if (!"admin".equals(userName) && !bank.getUserName().equals(userName)) {
                return failure("您没有权限删除该题库，仅创建者可删除！");
            }
            
            // 级联删除对应的题目
            LambdaQueryWrapper<Question> questionWrapper = Wrappers.<Question>lambdaQuery()
                    .eq(Question::getBankName, bank.getBankName());
            questionMapper.delete(questionWrapper);
            
            // 删除题库
            questionBankMapper.deleteById(id);
        }catch (Exception e){
            return failure("删除失败");
        }
        return success("删除成功");
    }

    /**
     * 编辑题库
     * @return
     */
    @ApiOperation(value = "编辑用户")
    @PutMapping()
    public ApiRest<String> update(@RequestBody QuestionBank questionBank){

        try {
            questionBankMapper.updateById(questionBank);
        }catch (Exception e){
            return failure("编辑失败");
        }
        return success("编辑成功");

    }

    /**
     * 新增题库
     * @return
     */
    @ApiOperation(value = "新增题库")
    @RequestMapping("/save")
    public ApiRest<String> save(@RequestBody QuestionBank questionBank ){
        String userName = (String) request.getSession().getAttribute("userName");
        questionBank.setUserName(userName);
        questionBank.setCreateTime(new Date());
        // 初始化各种题型数量为0
        questionBank.setChoiceCount(0);
        questionBank.setMultiCount(0);
        questionBank.setBlankFillingCount(0);
        questionBank.setJudgeCount(0);
        questionBank.setShortCount(0);
        
        try {
            questionBankMapper.insert(questionBank);
        }catch (Exception e){
            return failure("新增失败");
        }
        return success("新增成功");

    }

    /**
     * 该用户创建的题库名查询
     *
     * @return
     */
    @ApiOperation(value = "查询题库名称")
    @GetMapping("/getBankName")
    public ApiRest<?> getBankName() {
        LambdaQueryWrapper<QuestionBank> wrapper = Wrappers.<QuestionBank>lambdaQuery().orderByAsc(QuestionBank::getBankId);
        String userName =(String) request.getSession().getAttribute("userName");
        List<String> strings = questionBankMapper.selectBankName(userName);
        for (String s : strings) {
            System.out.println(s);
        }
        System.out.println(strings.toString());
        return success(strings);
    }

}

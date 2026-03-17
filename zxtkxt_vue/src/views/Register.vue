<template>
  <div class="register-container">
    <div class="register-card">
      <div class="register-header">
        <img src="@/assets/logo.png" alt="Logo" class="register-logo" v-if="hasLogo" @error="hasLogo = false">
        <h2 class="register-title">在线题库系统</h2>
      </div>

      <el-form 
        :model="ruleForm" 
        status-icon 
        :rules="rules" 
        ref="ruleForm" 
        class="register-form"
        label-position="top"
        size="large"
      >
        <el-form-item prop="userName">
          <el-input 
            v-model.number="ruleForm.userName" 
            placeholder="请输入用户名"
            prefix-icon="User"
          ></el-input>
        </el-form-item>

        <el-form-item prop="password">
          <el-input 
            type="password" 
            v-model="ruleForm.password" 
            placeholder="请输入密码"
            autocomplete="off" 
            show-password
            prefix-icon="Lock"
          ></el-input>
        </el-form-item>

        <el-form-item prop="checkPass">
          <el-input 
            type="password" 
            v-model="ruleForm.checkPass" 
            placeholder="请确认密码"
            autocomplete="off" 
            show-password
            prefix-icon="Lock"
          ></el-input>
        </el-form-item>

        <el-form-item prop="userRole">
          <div class="role-group">
            <el-radio-group v-model="ruleForm.userRole" fill="#1d6fbd">
              <el-radio-button label="教师">教师</el-radio-button>
              <el-radio-button label="管理员">管理员</el-radio-button>
            </el-radio-group>
          </div>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')" class="register-button" :loading="loading">注 册</el-button>
        </el-form-item>
        
        <div class="register-footer">
          <span class="has-account">已有账号？</span>
          <el-link type="primary" href="/#/login" :underline="false">立即登录</el-link>
        </div>
      </el-form>

    </div>
  </div>
</template>

<script>
import request from "@/utils/request";
import { User, Lock } from '@element-plus/icons-vue'

export default {
  name: "register",
  data() {
    var checkUserName = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('账号不能为空'));
      }
      callback();
    };

    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      } else {
        if (this.ruleForm.password !== '') {
          this.$refs.ruleForm.validateField('checkPass');
        }
        callback();
      }
    };

    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value !== this.ruleForm.password) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    };

    return {
      hasLogo: true,
      loading: false,
      ruleForm: {
        password: '',
        checkPass: '',
        userName: '',
        userRole: '教师',
      },
      rules: {
        userName: [
          { validator: checkUserName, required: true, trigger: 'blur' }
        ],
        password: [
          { validator: validatePass, required: true, trigger: 'blur' }
        ],
        checkPass: [
          { validator: validatePass2, required: true, trigger: 'blur' }
        ],
        userRole: [
          { required: true, message: '请选择身份', trigger: 'change' }
        ]
      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.loading = true;
          request.post('/user/registerCheck', this.ruleForm).then(res => {
            this.loading = false;
            if (res.code === 0){
              this.$message.success(res.msg || "注册成功");
              // Ensure the route starts with /
              const targetPath = res.data.startsWith('/') ? res.data : '/' + res.data;
              this.$router.push(targetPath);
            }else {
              this.$message.error(res.msg || "注册失败");
            }
          }).catch(error => {
            this.loading = false;
            console.error(error);
            this.$message.error("注册请求出错，请稍后重试");
          })
        } else {
          return false;
        }
      });
    }
  }
}
</script>

<style scoped>
.register-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  background: linear-gradient(135deg, #1d6fbd 0%, #6dd5fa 100%);
  background-size: cover;
  overflow: hidden;
}

.register-card {
  width: 420px;
  padding: 40px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.register-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
}

.register-header {
  text-align: center;
  margin-bottom: 30px;
}

.register-logo {
  width: 60px;
  height: 60px;
  margin-bottom: 10px;
  object-fit: contain;
}

.register-title {
  color: #333;
  font-size: 24px;
  font-weight: 600;
  margin: 0;
  letter-spacing: 1px;
}

.register-form {
  margin-top: 20px;
}

.role-group {
  display: flex;
  justify-content: center;
  width: 100%;
}

/* Make radio buttons full width */
:deep(.el-radio-group) {
  width: 100%;
  display: flex;
}

:deep(.el-radio-button) {
  flex: 1;
}

:deep(.el-radio-button__inner) {
  width: 100%;
  padding: 10px 0;
}

.register-button {
  width: 100%;
  padding: 22px 0;
  font-size: 16px;
  letter-spacing: 2px;
  font-weight: bold;
  margin-top: 10px;
  background: linear-gradient(90deg, #1d6fbd, #1890ff);
  border: none;
}

.register-button:hover {
  background: linear-gradient(90deg, #1890ff, #1d6fbd);
  opacity: 0.9;
}

.register-footer {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 15px;
  font-size: 14px;
}

.has-account {
  color: #666;
  margin-right: 5px;
}

/* Input Styles */
:deep(.el-input__wrapper) {
  padding: 5px 15px;
  background-color: #f5f7fa;
  box-shadow: none !important;
  border: 1px solid #e4e7ed;
  transition: all 0.3s;
}

:deep(.el-input__wrapper:hover),
:deep(.el-input__wrapper.is-focus) {
  background-color: white;
  border-color: #1d6fbd;
  box-shadow: 0 0 0 1px #1d6fbd !important;
}

:deep(.el-input__inner) {
  height: 40px;
}

/* Animations */
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.register-card {
  animation: fadeIn 0.6s ease-out;
}
</style>


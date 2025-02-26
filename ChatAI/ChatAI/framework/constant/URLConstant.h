//
//  URLConstant.h
//
//  Created by ss on 2018/7/17.
//  Copyright © 2018年 BigMelon. All rights reserved.
//

//#define BASE_URL            @"http://localhost:8080"
//#define BASE_URL            @"http://127.0.0.2:8080"
#define BASE_URL            @"http://192.168.0.102:8080"

#define url_userRegister_receiveCode BASE_URL@"/user/sendMsg"
#define url_userLogin BASE_URL@"/user/login"
#define url_category_list BASE_URL@"/category/list"
#define url_bill_page BASE_URL@"/bill/page"
#define url_bill_list BASE_URL@"/bill/list"
//保存账单
#define url_bill_save BASE_URL@"/bill/save"
#define url_bill_update BASE_URL@"/bill/update"
#define url_bill_delete BASE_URL@"/bill/delete"

#define url_common_upload BASE_URL@"/common/upload"
#define url_common_download BASE_URL@"/common/download"
#define url_bill_monthlist BASE_URL@"/bill/monthlist"

#define url_bill_categoryBilllist BASE_URL@"/bill/categoryBilllist"
#define url_user_nicknameChange BASE_URL@"/user/nickname/change"


#define url_user_delete BASE_URL@"/user/delete"

#define url_user_resetPwd BASE_URL@"/user/resetPwd"
#define url_user_pwdLogin BASE_URL@"/user/pwdLogin"

#define url_bill_getPreBills BASE_URL@"/bill/getPreBills"



import 'package:pica_comic/foundation/app.dart';

extension AppTranslation on String {
  String _translate() {
    var locale = App.locale;
    var key = "${locale.languageCode}_${locale.countryCode}";
    if (locale.languageCode == "en") {
      key = "en_US";
    }
    return (translations[key]?[this]) ?? this;
  }

  String get tl => _translate();

  String get tlEN => translations["en_US"]![this] ?? this;

  String tlParams(Map<String, String> values) {
    var res = _translate();
    for (var entry in values.entries) {
      res = res.replaceFirst("@${entry.key}", entry.value);
    }
    return res;
  }

  static const Map<String, Map<String, String>> translations = {
    'zh_CN': {
      "新到书": "新到旧",
      "Cloudflare Challenge": "需要进行安全挑战",
      "JM: Cloudflare Challenge": "需要进行安全挑战"
    },
    "zh_TW": {
      '有可用更新': '有可用更新',
      "下载管理器": "下載管理器",
      "有未完成的下载, 是否继续?": "有未完成的下載, 是否繼續?",
      "欢迎": "歡迎",
      "感谢使用本软件, 请注意:\n\n": "感謝使用本軟件, 請注意:\n\n",
      "本App的开发目的仅为学习交流与个人兴趣\n\n": "本App的開發目的僅為學習交流與個人興趣\n\n",
      "此项目与Picacg, e-hentai.org, JmComic, hitomi.la无任何关系":
          "此項目與Picacg, e-hentai.org, JmComic, hitomi.la, 紳士漫畫無任何關係",
      "需要身份验证": "需要身份驗證",
      "否": "否",
      "是": "是",
      '取消': '取消',
      '下载': '下載',
      "了解": "了解",
      "更多": "更多",
      "提交": "提交",
      "全选": "全選",
      "导出": "匯出",
      "查看漫画详情": "查看漫畫詳情",
      "确认": "確認",
      "删除": "刪除",
      "阅读": "閱讀",
      "暂停": "暫停",
      "重试": "重試",
      "继续": "繼續",
      "清除": "清除",
      "清除记录": "清除記錄",
      "要清除历史记录吗?": "要清除歷史記錄嗎?",
      "要删除这条历史记录吗": "要刪除這條歷史記錄嗎",
      "返回": "返回",
      "保存图片": "保存圖片",
      "分享": "分享",
      "登录": "登錄",
      "注册": "註冊",
      "直接进入": "直接進入",
      "转到设置": "轉到設置",
      "我": "我",
      "探索": "探索",
      "分类": "分類",
      "搜索": "搜索",
      "排行榜": "排行榜",
      "设置": "設置",
      "收藏夹": "收藏夾",
      "Picacg分类": "Picacg分類",
      "禁漫分类": "禁漫分類",
      "禁漫详细分类": "禁漫詳細分類",
      "已下载": "已下載",
      "Picacg游戏": "Picacg遊戲",
      "Eh主页": "Eh主頁",
      "Eh热门": "Eh熱門",
      "禁漫主页": "禁漫主頁",
      "禁漫最新": "禁漫最新",
      "Hitomi主页": "Hitomi主頁",
      "Hitomi中文": "Hitomi中文",
      "Hitomi日文": "Hitomi日文",
      "历史记录": "歷史記錄",
      "24小时": "24小時",
      '7天': '7天',
      '30天': '30天',
      "图片": "圖片",
      "下载未完成": "下載未完成",
      "有未完成的下载, 确定退出?": "有未完成的下載, 確定退出?",
      "要删除已选择的项目吗? 此操作无法撤销": "要刪除已選擇的項目嗎? 此操作無法撤銷",
      "浏览模式": "瀏覽模式",
      "选择浏览方式(仅哔咔)": "選擇瀏覽方式(僅哔咔)",
      "顺序浏览": "順序瀏覽",
      "分页浏览": "分頁瀏覽",
      "切换页面": "切換頁面",
      "页码": "頁碼",
      "输入范围: ": "輸入範圍: ",
      "跳页": "跳頁",
      "暂不支持": "暫不支持",
      "加载中": "加載中",
      "已选择 @num 个项目": "已選擇 @num 個項目",
      "请选择漫画": "請選擇漫畫",
      "一次只能导出一部漫画": "一次只能導出一部漫畫",
      "打包中": "打包中",
      "未知大小": "未知大小",
      "请选择一个漫画": "請選擇一個漫畫",
      "查看详情": "查看詳情",
      "下载出错": "下載出錯",
      " 已暂停": " 已暫停",
      " 下载中": " 下載中",
      "@length 项下载任务": "@length 項下載任務",
      "未登录": "未登錄",
      "正在获取用户信息": "正在獲取用戶信息",
      "网络错误": "網絡錯誤",
      "登录哔咔时发生错误\n": "登錄哔咔時發生錯誤\n",
      "登录禁漫时发生错误\n": "登錄禁漫時發生錯誤\n",
      "账号管理": "賬號管理",
      "查看或修改账号信息": "查看或修改賬號信息",
      "查看已收藏的漫画": "查看已收藏的漫畫",
      "管理已下载的漫画": "管理已下載的漫畫",
      "查看历史记录": "查看歷史記錄",
      "当前账户": "當前賬戶",
      "退出登录": "退出登錄",
      "禁漫账户": "禁漫賬戶",
      "信息:": "信息:",
      "邮箱": "郵箱",
      "重新登录": "重新登錄",
      "正在重新登录": "正在重新登錄",
      "重新登录成功": "重新登錄成功",
      "哔咔账号": "嗶咔賬號",
      "E-Hentai账号": "E-Hentai賬號",
      "目标": "目標",
      "禁漫漫画ID": "禁漫漫畫ID",
      "输入禁漫漫画ID": "輸入禁漫漫畫ID",
      "输入的ID不是数字": "輸入的ID不是數字",
      "漫画排序模式": "漫畫排序模式",
      "新到书": "新到舊",
      "旧到新": "舊到新",
      "最多喜欢": "最多喜歡",
      "最多指名": "最多指名",
      "最新": "最新",
      "最多点击": "最多點擊",
      "最多图片": "最多圖片",
      "哔咔热搜": "嗶咔熱搜",
      "禁漫热搜": "禁漫熱搜",
      "历史搜索": "歷史搜索",
      "清除历史记录": "清除歷史記錄",
      "@year 年前": "@year 年前",
      "@month 个月前": "@month 個月前",
      "@day 天前": "@day 天前",
      "@hour 小时前": "@hour 小時前",
      "@minute 分钟前": "@minute 分鐘前",
      "刚刚": "剛剛",
      "没有其它章节": "沒有其他章節",
      "切换章节": "切換章節",
      "章节": "章節",
      "(当前)": "(當前)",
      "退出": "退出",
      "第 @c 章": "第 @c 章",
      "当前": "當前",
      " 倒序": " 倒序",
      "未知": "未知",
      "继续阅读": "繼續閱讀",
      "从头开始": "從頭開始",
      "上次阅读到第 @ep 章第 @page 页, 是否继续阅读?": "上次閱讀到第 @ep 章第 @page 頁, 是否繼續閱讀?",
      "已经是第一页了": "已經是第一頁了",
      "已经是最后一页了": "已經是最後一頁了",
      "已经是最后一章了": "已經是最後一章了",
      "已经是第一章了": "已經是第一章了",
      "阅读设置": "閱讀設置",
      "点按翻页": "點按翻頁",
      "使用音量键翻页": "使用音量鍵翻頁",
      "宽屏时显示控制按钮": "寬屏時顯示控制按鈕",
      "保持屏幕常亮": "保持螢幕常亮",
      "夜间模式降低图片亮度": "夜間模式降低圖片亮度",
      "选择阅读模式": "選擇閱讀模式",
      "从左至右": "從左至右",
      "从右至左": "從右至左",
      "从上至下": "從上至下",
      "从上至下(连续)": "從上至下(連續)",
      "本子妹/本子母推荐": "本子妹/本子母推薦",
      "援助哔咔": "援助嗶咔",
      "将在外部浏览器中打开哔咔官方的援助页面, 是否继续?": "將在外部瀏覽器中打開嗶咔官方的援助頁面，是否繼續？",
      "已被屏蔽": "已被屏蔽",
      "选择漫画排序模式": "選擇漫畫排序模式",
      "没有任何结果": "沒有任何結果",
      "推荐": "推薦",
      "没有推荐, 可能等级不足": "沒有推薦，可能等級不足",
      "本子妹推荐": "本子妹推薦",
      "本子母推荐": "本子母推薦",
      "简介": "簡介",
      "相关推荐": "相關推薦",
      "收藏": "收藏",
      "要复制或者屏蔽这些关键词, 请长按或者使用鼠标右键": "要複製或者屏蔽這些關鍵詞，請長按或者使用滑鼠右鍵",
      "关闭": "關閉",
      " 作者": " 作者",
      " 汉化组": " 漢化組",
      " 分类": " 分類",
      " 标签": " 標籤",
      "复制": "複製",
      "已复制": "已複製",
      "添加到屏蔽词": "添加到屏蔽詞",
      "下载中": "下載中",
      "已加入下载": "已加入下載",
      "回复": "回覆",
      "评论至少需要2个字": "評論至少需要2個字",
      "评论": "評論",
      "输入的数字不合法": "輸入的數字不合法",
      "下一页": "下一頁",
      "下载游戏": "下載遊戲",
      "将前往哔咔游戏下载页面, 是否继续": "將前往嗶咔遊戲下載頁面，是否繼續",
      "屏幕截图": "屏幕截圖",
      "登录哔咔账号": "登錄嗶咔賬號",
      "转到注册": "轉到註冊",
      "账号": "賬號",
      "密码": "密碼",
      "您的登录密码": "您的登錄密碼",
      "登录中": "登錄中",
      "登录失败": "登錄失敗",
      "使用转发服务器": "使用轉發伺服器",
      "同时使用网络代理工具会减慢速度": "同時使用網絡代理工具會減慢速度",
      "旧密码错误": "舊密碼錯誤",
      "两次输入的密码不一致": "兩次輸入的密碼不一致",
      "密码至少8位": "密碼至少8位",
      "更换头像": "更換頭像",
      "请先选择图像": "請先選擇圖像",
      "上传成功": "上傳成功",
      "上传": "上傳",
      "失败": "失敗",
      "修改密码": "修改密碼",
      "输入旧密码": "輸入舊密碼",
      "输入新密码": "輸入新密碼",
      "再输一次新密码": "再輸一次新密碼",
      "密码修改成功": "密碼修改成功",
      "用户名": "用戶名",
      "等级": "等級",
      "自我介绍": "自我介紹",
      "更改自我介绍": "更改自我介紹",
      "不能为空": "不能為空",
      "个人信息": "個人信息",
      "要退出登录吗": "要退出登錄嗎",
      "确定": "確定",
      "注册哔咔账号": "註冊嗶咔賬號",
      "转到登录": "轉到登錄",
      "为防止滥用, 不能使用中转服务器进行注册": "為防止濫用，不能使用中轉伺服器進行註冊",
      "再输一次密码": "再輸一次密碼",
      "问题1": "問題1",
      "问题2": "問題2",
      "问题3": "問題3",
      "答案1": "答案1",
      "答案2": "答案2",
      "答案3": "答案3",
      "出生日期": "出生日期",
      "请输入完整信息": "請輸入完整信息",
      "注册成功": "註冊成功",
      "注册成功,但在登录时发生网络错误": "註冊成功，但在登錄時發生網絡錯誤",
      "选择搜索模式": "選擇搜索模式",
      "每周必看": "每週必看",
      "作者": "作者",
      "已经喜欢了": "已經喜歡了",
      "正在取消收藏": "正在取消收藏",
      "全部收藏": "全部收藏",
      "收藏漫画": "收藏漫畫",
      "选择收藏夹:": "選擇收藏夾:",
      "添加成功": "添加成功",
      "第1章": "第1章",
      "正在发送评论": "正在發送評論",
      "全部": "全部",
      "收藏夹:": "收藏夾:",
      "不可删除全部收藏": "不可刪除全部收藏",
      "确认删除": "確認刪除",
      "要删除这个收藏夹吗": "要刪除這個收藏夾嗎",
      "正在删除收藏夹": "正在刪除收藏夾",
      "删除成功": "刪除成功",
      "创建收藏夹": "創建收藏夾",
      "名称": "名稱",
      "成功创建": "成功創建",
      "总排行": "總排行",
      "月排行": "月排行",
      "周排行": "周排行",
      "日排行": "日排行",
      "登录禁漫天堂": "登錄禁漫天堂",
      "韩漫": "韓漫",
      "日漫": "日漫",
      "其它": "其他",
      "未知错误": "未知錯誤",
      "添加收藏成功": "添加收藏成功",
      "取消收藏成功": "取消收藏成功",
      "类型": "類型",
      "语言": "語言",
      "今天": "今天",
      "本周": "本週",
      "本月": "本月",
      "今年": "今年",
      "评分": "評分",
      "发布评论": "發布評論",
      "评论成功": "評論成功",
      "昨天": "昨天",
      "一个月": "一個月",
      "一年": "一年",
      "所有时间": "所有時間",
      "登录E-Hentai账户": "登錄E-Hentai賬戶",
      "使用cookie登录": "使用cookie登錄",
      "igneous(非必要)": "igneous(非必要)",
      "请填写完整": "請填寫完整",
      "在Webview中登录": "在Webview中登錄",
      "由于需要captcha响应, 暂不支持直接密码登录": "由於需要captcha響應，暫不支持直接密碼登錄",
      "无": "無",
      "下载全部": "下載全部",
      "下载选择": "下載選擇",
      "下载漫画": "下載漫畫",
      "加载中...": "加載中...",
      "登录失效": "登錄失效",
      "成功保存于Picture中": "成功保存於Picture中",
      "保存失败": "保存失敗",
      "分享失败": "分享失敗",
      "浏览": "瀏覽",
      "关键词屏蔽": "關鍵詞屏蔽",
      "设置代理": "設置代理",
      "启用的漫画源": "啟用的漫畫源",
      "仅安卓端有效": "僅安卓端有效",
      "优化鼠标阅读体验": "優化滑鼠閱讀體驗",
      "检查更新": "檢查更新",
      "当前:": "當前:",
      "启动时检查更新": "啟動時檢查更新",
      "设置下载目录": "設置下載目錄",
      "缓存大小": "緩存大小",
      "计算中": "計算中",
      "清除缓存": "清除緩存",
      "隐私": "隱私",
      "阻止屏幕截图": "阻止螢幕截圖",
      "需要重启App以应用更改": "需要重啟App以應用更改",
      "如果系统中未设置任何认证方法请勿开启": "如果系統中未設定任何認證方法請勿開啟",
      "本软件仅用于学习交流": "本軟體僅用於學習交流",
      "项目地址": "項目地址",
      "提出建议": "提出建議",
      "正在检查更新": "正在檢查更新",
      "关闭更新检查": "關閉更新檢查",
      "已是最新版本": "已是最新版本",
      "使用系统代理": "使用系統代理",
      "使用系统代理时无法手动设置": "使用系統代理時無法手動設定",
      "设置代理, 例如127.0.0.1:7890": "設置代理, 例如127.0.0.1:7890",
      "设置漫画源": "設置漫畫源",
      "禁漫天堂": "禁漫天堂",
      "路径": "路徑",
      "为空表示使用App数据目录": "為空表示使用App資料目錄",
      "转移数据": "轉移數據",
      "正在复制文件": "正在複製文件",
      "更新成功": "更新成功",
      "目录不存在": "目錄不存在",
      "现在的路径为": "現在的路徑為",
      "添加": "添加",
      "添加屏蔽关键词": "添加屏蔽關鍵詞",
      "添加关键词": "添加關鍵詞",
      "关键词屏蔽不会生效于收藏夹和历史记录, 屏蔽的依据仅限加载漫画列表时能够获取到的信息":
          "關鍵詞屏蔽不會生效於收藏夾和歷史記錄, 屏蔽的依據僅限加載漫畫列表時能夠獲取到的資訊",
      "画廊站点": "畫廊站點",
      "分类中漫画排序模式": "分類中漫畫排序模式",
      "搜索中漫画排序模式": "搜索中漫畫排序模式",
      "设置分流": "設置分流",
      "分流1": "分流1",
      "分流2": "分流2",
      "分流3": "分流3",
      "分流4": "分流4",
      "清除登录状态": "清除登錄狀態",
      "不使用": "不使用",
      "使用哔咔官方提供的IP": "使用哔咔官方提供的IP",
      "自定义": "自定義",
      "输入一个Cloudflare CDN Ip": "輸入一個Cloudflare CDN Ip",
      "哔咔漫画": "哔咔漫畫",
      "正在获取分流IP": "正在獲取分流IP",
      "设置图片质量": "設置圖片質量",
      "低": "低",
      "中": "中",
      "高": "高",
      "原图": "原圖",
      "设置搜索及分类排序模式": "設置搜索及分類排序模式",
      "显示头像框": "顯示頭像框",
      "切换": "切換",
      "漫画列表显示方式": "漫畫列表顯示方式",
      "适用于非探索页面": "適用於非探索頁面",
      "绅士漫画": "紳士漫畫",
      "自动打卡": "自動打卡",
      "初始页面": "初始頁面",
      "已下载的漫画排序方式": "已下載的漫畫排序方式",
      "优先加载原图": "優先加載原圖",
      "图片预加载": "圖片預加載",
      "自动翻页时间间隔": "自動翻頁時間間隔",
      "阅读器缓存限制": "閱讀器緩存限制",
      "主题选择": "主題選擇",
      "深色模式": "深色模式",
      "清除所有数据": "清除所有數據",
      "打卡成功": "打卡成功",
      "本地": "本地",
      "网络": "網絡",
      "导出用户数据": "導出用戶數據",
      "将导出设置, 账号, 历史记录, 下载内容, 本地收藏等数据": "將導出設置, 賬號, 歷史記錄, 下載內容, 本地收藏等數據",
      "导入用户数据": "導入用戶數據",
      "将导入设置, 账号, 历史记录, 下载内容, 本地收藏等数据, 现在的所有数据将会被覆盖":
          "將導入設置, 賬號, 歷史記錄, 下載內容, 本地收藏等數據, 現在的所有數據將會被覆蓋",
      "订阅": "訂閱",
      "浏览订阅的漫画": "瀏覽訂閱的漫畫",
      "建议": "建議",
      "清空": "清空",
      "禁用长度限制": "禁用長度限制",
      "确认清除缓存": "確認清除緩存",
      "警告": "警告",
      "此操作无法撤销, 是否继续": "此操作無法撤銷，是否繼續",
      //v2.2.6
      "新建": "新增",
      "排序": "排序",
      "重命名": "重命名",
      "切换源": "更改來源",
      "默认收藏夹": "預設資料夾",
      "用于快速收藏": "用於快速收藏",
      "无效的默认收藏夹": "無效的預設資料夾",
      "必须设置一个有效的收藏夹才能使用快速收藏": "必須設置一個有效的收藏夾才能使用快速收藏",
      "前往设置": "前往設定",
      "应用链接": "應用程式連結",
      "在系统设置中管理APP支持的链接": "在系統設定中管理APP支援的鏈接",
      "网络收藏": "網路收藏",
      "取消收藏": "取消收藏",
      //v2.2.7
      "本地收藏": "本地收藏",
      "新收藏添加至": "新收藏新增至",
      "阅读后移动本地收藏至": "閱讀後移動本地收藏至",
      "最前": "最前",
      "最后": "最後",
      "无操作": "無操作",
      "长按缩放": "長按縮放",
      "同步数据中": "同步資料中",
      "最少星星": "最少星星",
      "高级选项": "進階選項",
      "热搜": "熱搜",
      "隐藏": "隱藏",
      "显示收藏": "顯示收藏",
      // v2.3.0
      "规则": "規則",
      "探索页面": "探索頁面",
      "点击时的操作": "點擊時的操作",
      "查看信息": "查看詳情",
      "显示页面信息": "顯示頁面訊息",
      "从文件导入": "從文件導入",
      "从网络导入": "從網路導入",
      "复制到": "複製到",
      // v2.3.2
      "这里什么都没有": "現在這裡什麼都沒有",
      "前往": "前往",
      "寻找漫画": "尋找漫畫",
      "随机": "隨機",
      "长度": "長度",
      "链接": "連結",
      "禁漫ID": "禁漫ID",
      "排序方式": "排序方式",
      "检查剪切板中的链接": "檢查剪貼簿中的連結",
      "漫画信息页面工具栏": "漫畫資訊頁面工具欄",
      "漫画块大小": "漫畫區塊大小",
      "默认搜索源": "預設搜尋來源",
      "启用侧边翻页栏": "啟用側邊翻頁欄",
      "高刷新率模式": "高刷新率模式",
      "帮助": "幫助",
      "显示本地收藏的数量": "顯示本地收藏的數量",
      "使用须知": "使用須知",
      "感谢使用本软件, 请注意:": "感謝使用本軟體, 請注意:",
      """
      本App的开发目的仅为学习交流与个人兴趣, 显示的任何内容均来自网络, 与开发者无关.
      此项目与Picacg, e-hentai.org, JmComic, hitomi.la, 紳士漫畫, nhentai无任何关系.
      如果在使用中发现问题, 请先确认是否为自己的设备问题, 然后再进行反馈.""": """
      本App的開發目的僅為學習交流與個人興趣, 顯示的任何內容均來自網絡, 與開發者無關.
      此項目與Picacg, e-hentai.org, JmComic, hitomi.la, 紳士漫畫, nhentai無任何關係.
      如果在使用中發現問題, 請先確認是否為自己的設備問題, 然後再進行反饋.
      """,
      "我已阅读并知晓": "我已閱讀並同意",
      "更多设置": "更多設定",
      "登录账号": "登入帳號",
      "进入APP": "進入APP",
      "请先阅读使用须知": "請先閱讀使用須知",
      "要管理收藏夹, 请长按收藏夹标签或者使用鼠标右键": "要管理收藏夾, 請長按收藏夾標籤或使用滑鼠右鍵",
    },
    'en_US': {
      '有可用更新': 'Updates available',
      "下载管理器": "Download manager",
      "有未完成的下载, 是否继续?": "There are unfinished downloads, continue?",
      "欢迎": "Welcome",
      "感谢使用本软件, 请注意:\n\n":
          "Thank you for using this software, please note:\n\n",
      "本App的开发目的仅为学习交流与个人兴趣\n\n":
          "The development purpose of this App is solely for learning, communication, and personal interest\n\n",
      "此项目与Picacg, e-hentai.org, JmComic, hitomi.la无任何关系":
          "This project has no affiliation with Picacg, e-hentai.org, JmComic, hitomi.la",
      "需要身份验证": "Authentication required",
      "否": "No",
      "是": "Yes",
      '取消': 'Cancel',
      '下载': 'Download',
      "了解": "OK",
      "更多": "More",
      "提交": "Submit",
      "全选": "Select all",
      "导出": "Export",
      "查看漫画详情": "View Comic Details",
      "确认": "Confirm",
      "删除": "Delete",
      "阅读": "Read",
      "暂停": "Pause",
      "重试": "Retry",
      "继续": "Continue",
      "清除": "Clear",
      "清除记录": "Clear History",
      "要清除历史记录吗?": "Do you want to clear the history?",
      "要删除这条历史记录吗": "Do you want to delete this history record?",
      "返回": "Back",
      "保存图片": "Save Image",
      "分享": "Share",
      "登录": "Log In",
      "注册": "Register",
      "直接进入": "Enter Directly",
      "转到设置": "Go to Settings",
      "我": "Me",
      "探索": "Explore",
      "分类": "Category",
      "搜索": "Search",
      "排行榜": "Ranking",
      "设置": "Settings",
      "收藏夹": "Favorites",
      "Picacg分类": "Picacg Categories",
      "禁漫分类": "Hentai Categories",
      "禁漫详细分类": "Detailed Hentai Categories",
      "已下载": "Downloaded",
      "Picacg游戏": "Picacg Games",
      "Eh主页": "Eh Homepage",
      "Eh热门": "Eh Popular",
      "禁漫主页": "JM Homepage",
      "禁漫最新": "JM Latest",
      "Hitomi主页": "Hitomi Homepage",
      "Hitomi中文": "Hitomi Chinese",
      "Hitomi日文": "Hitomi Japanese",
      "历史记录": "History",
      "24小时": "24 Hours",
      '7天': '7 Days',
      '30天': '30 Days',
      "图片": "Image",
      "下载未完成": "Download Incomplete",
      "有未完成的下载, 确定退出?":
          "There are unfinished downloads, are you sure you want to exit?",
      "要删除已选择的项目吗? 此操作无法撤销":
          "Do you want to delete the selected items? This operation cannot be undone",
      "浏览模式": "Browsing Mode",
      "选择浏览方式(仅哔咔)": "Select browsing mode (Bilibili Comics only)",
      "顺序浏览": "Sequential Browsing",
      "分页浏览": "Pagination Browsing",
      "切换页面": "Switch Page",
      "页码": "Page Number",
      "输入范围: ": "Input Range: ",
      "跳页": "Jump Page",
      "暂不支持": "Not Supported at the Moment",
      "加载中": "Loading",
      "已选择 @num 个项目": "Selected @num items",
      "请选择漫画": "Please select a comic",
      "一次只能导出一部漫画": "You can only export one comic at a time",
      "打包中": "Packing",
      "未知大小": "Unknown Size",
      "请选择一个漫画": "Please select a comic",
      "查看详情": "View Details",
      "下载出错": "Download Error",
      " 已暂停": " Paused",
      " 下载中": " Downloading",
      "@length 项下载任务": "@length Download Tasks",
      "未登录": "Not Logged In",
      "正在获取用户信息": "Getting User Information",
      "网络错误": "Network Error",
      "登录哔咔时发生错误\n": "Error occurred while logging into Picacg Comics\n",
      "登录禁漫时发生错误\n": "Error occurred while logging into JMComic\n",
      "账号管理": "Accounts",
      "查看或修改账号信息": "View or Modify Account Information",
      "查看已收藏的漫画": "View Favorited Comics",
      "管理已下载的漫画": "Manage Downloaded Comics",
      "查看历史记录": "View History",
      "当前账户": "Current Account",
      "退出登录": "Log Out",
      "禁漫账户": "Hentai Account",
      "信息:": "Information:",
      "邮箱": "Email",
      "重新登录": "Log In Again",
      "正在重新登录": "Logging in again",
      "重新登录成功": "Re-login successful",
      "哔咔账号": "Picacg Account",
      "E-Hentai账号": "E-Hentai Account",
      "目标": "Target",
      "禁漫漫画ID": "JMComic Comic ID",
      "输入禁漫漫画ID": "Enter JMComic ID",
      "输入的ID不是数字": "The entered ID is not a number",
      "漫画排序模式": "Comic Sorting Mode",
      "新到书": "New to Old",
      "旧到新": "Old to New",
      "最多喜欢": "Most Likes",
      "最多指名": "Most Nominated",
      "最新": "Newest",
      "最多点击": "Most Clicks",
      "最多图片": "Most Images",
      "哔咔热搜": "Picacg Hot Search",
      "禁漫热搜": "JMComic Hot Search",
      "历史搜索": "History",
      "清除历史记录": "Clear History",
      "@year 年前": "@year years ago",
      "@month 个月前": "@month months ago",
      "@day 天前": "@day days ago",
      "@hour 小时前": "@hour hours ago",
      "@minute 分钟前": "@minute minutes ago",
      "刚刚": "Just now",
      "没有其它章节": "No other chapters",
      "切换章节": "Chapters",
      "章节": "Chapter",
      "(当前)": "(Current)",
      "退出": "Exit",
      "第 @c 章": "Chapter @c",
      "当前": "Current",
      " 倒序": "Reverse Order",
      "未知": "Unknown",
      "继续阅读": "Continue",
      "从头开始": "Start Reading",
      "上次阅读到第 @ep 章第 @page 页, 是否继续阅读?":
          "Last read at Chapter @ep, Page @page. Do you want to continue reading?",
      "上次阅读到第 @ep 章第 @page 页": "Last read at Chapter @ep, Page @page.",
      "已经是第一页了": "Already on the first page",
      "已经是最后一页了": "Already on the last page",
      "已经是最后一章了": "Already on the last chapter",
      "已经是第一章了": "Already on the first chapter",
      "阅读设置": "Reading Settings",
      "点按翻页": "Tap to Flip Page",
      "使用音量键翻页": "Use Volume Keys to Flip Page",
      "宽屏时显示控制按钮": "Show control buttons in widescreen",
      "保持屏幕常亮": "Keep Screen On",
      "深色模式下降低图片亮度": "Reduce Image Brightness in dark mode",
      "选择阅读模式": "Select Reading Mode",
      "从左至右": "Left to Right",
      "从右至左": "Right to Left",
      "从上至下": "Top to Bottom",
      "从上至下(连续)": "Top to Bottom (Continuous)",
      "援助哔咔": "Support Picacg",
      "将在外部浏览器中打开哔咔官方的援助页面, 是否继续?":
          "This will open Picacg's official support page in an external browser. Continue?",
      "已被屏蔽": "Blocked",
      "选择漫画排序模式": "Select Comic Sorting Mode",
      "没有任何结果": "No results found",
      "推荐": "Recommend",
      "没有推荐, 可能等级不足": "No recommendations, possibly due to insufficient level",
      "简介": "Introduction",
      "相关推荐": "Related",
      "收藏": "Favorite",
      "要复制或者屏蔽这些关键词, 请长按或者使用鼠标右键":
          "To copy or block these keywords, please long-press or right-click",
      "关闭": "Close",
      " 作者": " Author",
      " 汉化组": " Translation Team",
      " 分类": " Category",
      " 标签": " Tags",
      "复制": " Copy",
      "下载中": "Downloading",
      "已加入下载": "Added to Downloads",
      "回复": "Reply",
      "评论至少需要2个字": "Comments must be at least 2 characters long",
      "评论": "Comment",
      "输入的数字不合法": "Invalid input for numbers",
      "下一页": "Next Page",
      "下载游戏": "Download Game",
      "将前往哔咔游戏下载页面, 是否继续":
          "You will be redirected to the Picacg Games download page, do you want to continue?",
      "屏幕截图": "Screenshot",
      "登录哔咔账号": "Log in to Picacg Account",
      "转到注册": "Go to Registration",
      "账号": "Account",
      "密码": "Password",
      "您的登录密码": "Your login password",
      "登录中": "Logging in",
      "登录失败": "Login Failed",
      "使用转发服务器": "Use Forwarding Server",
      "同时使用网络代理工具会减慢速度": "Using network proxy tools will slow down the speed",
      "旧密码错误": "Incorrect old password",
      "两次输入的密码不一致": "Passwords entered do not match",
      "密码至少8位": "Password must be at least 8 characters",
      "更换头像": "Change Avatar",
      "请先选择图像": "Please select an image first",
      "上传成功": "Upload successful",
      "上传": "Upload",
      "失败": "Failed",
      "修改密码": "Change Password",
      "输入旧密码": "Enter old password",
      "输入新密码": "Enter new password",
      "再输一次新密码": "Re-enter new password",
      "密码修改成功": "Password changed successfully",
      "用户名": "Username",
      "等级": "Level",
      "自我介绍": "Self-introduction",
      "更改自我介绍": "Change self-introduction",
      "不能为空": "Cannot be empty",
      "个人信息": "Personal Information",
      "要退出登录吗": "Do you want to log out?",
      "确定": "Confirm",
      "注册哔咔账号": "Register Picacg Account",
      "转到登录": "Go to Login",
      "为防止滥用, 不能使用中转服务器进行注册":
          "To prevent abuse, registration through a relay server is not allowed",
      "再输一次密码": "Re-enter password",
      "问题1": "Question 1",
      "问题2": "Question 2",
      "问题3": "Question 3",
      "答案1": "Answer 1",
      "答案2": "Answer 2",
      "答案3": "Answer 3",
      "出生日期": "Date of Birth",
      "请输入完整信息": "Please enter complete information",
      "注册成功": "Registration successful",
      "注册成功,但在登录时发生网络错误":
          "Registration successful, but a network error occurred during login",
      "选择搜索模式": "Choose search mode",
      "每周必看": "Must-See Weekly",
      "作者": "Author",
      "已经喜欢了": "Already liked",
      "正在取消收藏": "Canceling collection",
      "全部收藏": "All collections",
      "收藏漫画": "Favorite Comics",
      "选择收藏夹:": "Select collection:",
      "添加成功": "Added successfully",
      "第1章": "Chapter 1",
      "正在发送评论": "Sending comment",
      "全部": "All",
      "收藏夹:": "Collection:",
      "不可删除全部收藏": "Cannot delete all favorites",
      "确认删除": "Confirm deletion",
      "要删除这个收藏夹吗": "Do you want to delete this collection?",
      "正在删除收藏夹": "Deleting collection",
      "删除成功": "Deletion successful",
      "创建收藏夹": "Create collection",
      "名称": "Name",
      "成功创建": "Successfully created",
      "总排行": "Overall Ranking",
      "月排行": "Monthly Ranking",
      "周排行": "Weekly Ranking",
      "日排行": "Daily Ranking",
      "登录禁漫天堂": "Login to JMComic",
      "韩漫": "Korean Comics",
      "日漫": "Japanese Comics",
      "其它": "Other",
      "未知错误": "Unknown error",
      "添加收藏成功": "Favorite added successfully",
      "取消收藏成功": "Unfavorite successful",
      "类型": "Type",
      "语言": "Language",
      "今天": "Today",
      "本周": "This week",
      "本月": "This month",
      "今年": "This year",
      "评分": "Rating",
      "发布评论": "Post a comment",
      "评论成功": "Comment posted successfully",
      "昨天": "Yesterday",
      "一个月": "One month",
      "一年": "One year",
      "所有时间": "All time",
      "登录E-Hentai账户": "Login to E-Hentai",
      "使用cookie登录": "Login with cookies",
      "igneous(非必要)": "igneous (optional)",
      "请填写完整": "Please fill in completely",
      "在Webview中登录": "Login in Webview",
      "由于需要captcha响应, 暂不支持直接密码登录":
          "Direct password login is not supported due to the need for captcha response",
      "无": "None",
      "下载全部": "Download all",
      "下载选择": "Download selection",
      "下载漫画": "Download comics",
      "加载中...": "Loading...",
      "登录失效": "Login expired",
      "成功保存于Picture中": "Successfully saved in Picture",
      "保存失败": "Save failed",
      "分享失败": "Share failed",
      "浏览": "Browse",
      "关键词屏蔽": "Keyword blocking",
      "设置代理": "Set proxy",
      "启用的漫画源": "Enabled comic sources",
      "仅安卓端有效": "Only effective on Android",
      "优化鼠标阅读体验": "Optimize mouse reading experience",
      "检查更新": "Check for updates",
      "当前:": "Current:",
      "启动时检查更新": "Check for updates on startup",
      "设置下载目录": "Set download directory",
      "缓存大小": "Cache size",
      "计算中": "Calculating",
      "清除缓存": "Clear cache",
      "隐私": "Privacy",
      "阻止屏幕截图": "Block screen capture",
      "需要重启App以应用更改": "App needs to be restarted to apply changes",
      "如果系统中未设置任何认证方法请勿开启":
          "Do not enable if no authentication methods are set in the system",
      "本软件仅用于学习交流": "This software is for learning and communication only",
      "项目地址": "Repository",
      "提出建议": "Submit suggestions",
      "正在检查更新": "Checking for updates",
      "关闭更新检查": "Turn off update check",
      "已是最新版本": "Already the latest version",
      "使用系统代理": "Use system proxy",
      "使用系统代理时无法手动设置":
          "Manual settings are not available when using system proxy",
      "设置代理, 例如127.0.0.1:7890": "Set proxy, e.g., 127.0.0.1:7890",
      "设置漫画源": "Set comic source",
      "禁漫天堂": "JMComic",
      "路径": "Path",
      "为空表示使用App数据目录": "Empty indicates the use of the App data directory",
      "转移数据": "Transfer data",
      "正在复制文件": "Copying files",
      "更新成功": "Update successful",
      "目录不存在": "Directory does not exist",
      "现在的路径为": "Current path is",
      "添加": "Add",
      "添加屏蔽关键词": "Add blocked keywords",
      "添加关键词": "Add keywords",
      "关键词屏蔽不会生效于收藏夹和历史记录, 屏蔽的依据仅限加载漫画列表时能够获取到的信息":
          "Keyword blocking does not affect favorites and history. It is based on information available only when loading the comic list.",
      "画廊站点": "Gallery site",
      "分类中漫画排序模式": "Comic sorting mode in categories",
      "搜索中漫画排序模式": "Comic sorting mode in searches",
      "设置分流": "Set stream",
      "分流1": "Stream 1",
      "分流2": "Stream 2",
      "分流3": "Stream 3",
      "分流4": "Stream 4",
      "清除登录状态": "Clear login status",
      "不使用": "Do not use",
      "使用哔咔官方提供的IP": "Use the IP provided by Bika official",
      "自定义": "Custom",
      "哔咔漫画": "Picacg",
      "设置图片质量": "Set image quality",
      "低": "Low",
      "中": "Medium",
      "高": "High",
      "原图": "Original image",
      "设置搜索及分类排序模式": "Set search and category sorting mode",
      "显示头像框": "Display avatar frame",
      "切换": "Toggle",
      "漫画列表显示方式": "Comic list display mode",
      "适用于非探索页面": "Applicable to non-exploration pages",
      "自动打卡": "Auto check-in",
      "初始页面": "Initial page",
      "已下载的漫画排序方式": "Sorting mode for downloaded comics",
      "优先加载原图": "Prioritize loading original images",
      "图片预加载": "Image preloading",
      "自动翻页时间间隔": "Auto page turn interval",
      "阅读器缓存限制": "Reader cache limit",
      "主题选择": "Theme selection",
      "深色模式": "Dark mode",
      "清除所有数据": "Clear all data",
      "打卡成功": "Check-in successful",
      "本地": "Local",
      "网络": "Network",
      "导出用户数据": "Export user data",
      "将导出设置, 账号, 历史记录, 下载内容, 本地收藏等数据":
          "Export settings, accounts, history, downloaded content, local favorites, and other data",
      "导入用户数据": "Import user data",
      "将导入设置, 账号, 历史记录, 下载内容, 本地收藏等数据, 现在的所有数据将会被覆盖":
          "Import settings, accounts, history, downloaded content, local favorites, and other data. All existing data will be overwritten.",
      "订阅": "Subscribe",
      "浏览订阅的漫画": "Browse subscribed comics",
      "建议": "Suggestions",
      "清空": "Clear",
      "禁用长度限制": "Disable length limit",
      "确认清除缓存": "Confirm clearing cache",
      "警告": "Warning",
      "此操作无法撤销, 是否继续":
          "This operation cannot be undone. Do you want to continue?",
      "显示的探索页面": "Displayed explore Pages",
      "漫画源(非探索页面)": "Comic Source(not explore pages)",
      "双页": "Two page",
      "双页(反向)": "Two page(reserved)",
      "翻页动画": "Page turning animation",
      "留空表示禁用网络代理": "Leave blank to disable web proxy",
      "App内部储存目录": "App internal storage directory",
      "外观": "Appearance",
      "跟随系统": "system",
      "启用": "on",
      "禁用": "off",
      "API分流": "API Stream",
      "图片分流": "Image Stream",
      "顺序显示": "In order",
      "分页显示": "Page break",
      "时间": "Time",
      "漫画名": "Title",
      "作者名": "Author",
      "大小": "Size",
      "关于": "About",
      "收藏夹漫画排序模式": "Comic sorting mode in favorites",
      "启动时执行": "Execute at startup",
      "APP启动或是距离上次打卡间隔一天时执行":
          "Executed when the APP is started or one day after the last check-in",
      "如果登录失效点击此处": "Click here if login expires",
      "已登录": "Logged in",
      "查看": "View",
      "热门 | 今天": "Popular|Today",
      "热门 | 一周": "Popular|Week",
      "热门 | 本月": "Popular|Month",
      "热门 | 一年": "Popular|Year",
      "热门 | 所有时间": "Popular | All Time",
      "点按翻页识别范围": "Range of Tapping to Flip Page",
      "图片缩放": "Image zoom",
      "容纳": "contain",
      "适应宽度": "fit width",
      "适应高度": "fit height",
      "复制标题": "copy title",
      "复制链接": "copy link",
      "在浏览器中打开": "open in browser",
      "搜索相似画廊": "search similar gallery",
      "工具": "Tools",
      "使用工具发现更多漫画": "Find more comics with tools",
      "收藏夹中漫画排序模式": "Comic sorting mode in favorite folder",
      "最新更新": "Update Time",
      "最新收藏": "Favorite Time",
      "搜索选项": "Search Options",
      "已固定": "Pinned",
      "固定": "Pin",
      "开始使用": "Start using",
      "使用前须知": "Instructions before use",
      "感谢使用本软件, 请注意:\n": "Thanks for using this software, please note:\n",
      "此项目与Picacg, e-hentai.org, JmComic, hitomi.la, 紳士漫畫, nhentai无任何关系":
          "This project has no connection with Picacg, e-hentai.org, JmComic, hitomi.la, wnacg.com, nhentai",
      "下面将进行一些基本设置, 所有的设置在之后均可进行更改":
          "We will make some basic settings, all of which can be changed later.",
      "选择应当如何显示漫画": "Choose how the comic should be displayed",
      "探索页面不受此设置影响\n顺序显示时, 当下滑至顶部将自动加载下一页, 并且添加至页面底部;\n":
          "The exploration page is not affected by this setting\nWhen displayed sequentially, the next page will be automatically loaded when scrolling to the top;\n",
      "分页显示时, 将会在页面底部显示当前页面的序号和切换页面的按钮, 可以手动输入页数":
          "When displayed in pages, the serial number of the current page and the button to switch pages will be displayed at the bottom of the page.",
      "设置App外观": "Set App appearance",
      "在设置中更改更多选项": "Change more options in settings page",
      "在账号管理页面登录账号": "Log in to your accounts",
      "打开账号管理页面": "Open the account management page",
      "完成": "All Done",
      "祝使用愉快": "Happy use",
      "EH订阅": "EH Subscription",
      "打开链接": "Open Link",
      "图片搜索 [搜图bot酱]": "Image Search [搜图bot酱]",
      "图片搜索 [SauceNAO]": "Image Search [SauceNAO]",
      "输入链接": "Enter Link",
      "不支持的链接": "Unsupported Link",
      "打开": "open",
      "限制图片最大显示宽度": "Limit image width",
      "倒序": "Reverse",
      "漫画块显示模式": "Display mode of comic tile",
      "需要重新加载页面": "Requires page reload",
      "数据同步": "Data Sync",
      "简略": "Brief",
      "详细": "Detailed",
      "最小": "Minimal",
      "储存路径": "Storage Path",
      "请确保路径存在": "Make sure the path exists",
      "立即执行:": "Run Now:",
      "上传数据": "Upload",
      "下载数据": "Download",
      "将URL留空以禁用同步": "Leave the URL blank to disable sync",
      "详细(大)": "Detailed(Big)",
      "忽略警告": "Ignore Warning",
      "已收藏": "Added",
      "忽略": "Ignore",
      "此画廊存在令人不适的内容\n在设置中可以禁用此警告":
          "This gallery contains objectionable content\nThis warning can be disabled in settings",
      "预览": "Preview",
      "漫画源": "Comic Source",
      "双击缩放": "Double tap to zoom",
      "日志": "Logs",
      "更新": "Update",
      "数据": "Data",
      "提出建议(Github)": "Make a suggestion(Github)",
      "通过电子邮件联系我": "Contact me via email",
      "支持开发": "Support Development",
      "Pica Comic是一个完全免费的漫画阅读APP": "Pica Comic is a free comic reading APP",
      "仅用于学习交流": "For learning and communication",
      "加入Telegram群": "Join Telegram Group",
      "绅士漫画": "HtComic",
      "上一页": "Last Page",
      "页面": "Page",
      // v2.2.6
      "新建": "New",
      "排序": "Reorder",
      "重命名": "Rename",
      "切换源": "Change Source",
      "默认收藏夹": "Default Folder",
      "用于快速收藏": "Used to quickly add favorites",
      "无效的默认收藏夹": "Invalid Default Folder",
      "必须设置一个有效的收藏夹才能使用快速收藏":
          "A valid favorite must be set up to use this feature.",
      "前往设置": "settings",
      "应用链接": "App Links",
      "在系统设置中管理APP支持的链接": "Manage APP links in system settings",
      "网络收藏": "Network collection",
      "取消收藏": "Unfavorite",
      // v2.2.7
      "本地收藏": "Local Favorites",
      "新收藏添加至": "Add new favorite to",
      "阅读后移动本地收藏至": "After reading, move local favorite to",
      "最前": "front",
      "最后": "end",
      "无操作": "no",
      "长按缩放": "Long press to zoom",
      "同步数据中": "Synchronizing data",
      "最少星星": "Min Stars",
      "高级选项": "Advanced Options",
      "热搜": "Hot Search",
      "隐藏": "Hide",
      "显示收藏": "Show Favorites",
      // v2.3.0
      "规则": "rule",
      "探索页面": "Explore pages",
      "点击时的操作": "Action on click",
      "查看信息": "View Info",
      "显示页面信息": "Show page information",
      "从文件导入": "From file",
      "从网络导入": "From network",
      "复制到": "Copy",
      "打开一个收藏夹并使用右上角按钮": "Open a Folder and use the top right button",
      // v2.3.2
      "这里什么都没有": "Nothing here now",
      "前往": "Go to ",
      "寻找漫画": " to find comics",
      "随机": "Random",
      "长度": "Length",
      "链接": "Link",
      "禁漫ID": "JM ID",
      "排序方式": "Sort by",
      "检查剪切板中的链接": "Check links in clipboard",
      "漫画信息页面工具栏": "Toolbar on the manga information page",
      "漫画块大小": "Size of the comic tile",
      "默认搜索源": "Default search source",
      "启用侧边翻页栏": "Enable Side Flip Bar",
      "高刷新率模式": "High refresh rate mode",
      "帮助": "Help",
      "显示本地收藏的数量": "Displays the number of local favourites",
      "覆盖": "cover",
      "漫画块缩略图布局": "Thumbnail Layout",
      "使用须知": "Notice",
      "感谢使用本软件, 请注意:": "Thank you for using this app, please note:",
      """
本App的开发目的仅为学习交流与个人兴趣, 显示的任何内容均来自网络, 与开发者无关.
此项目与Picacg, e-hentai.org, JmComic, hitomi.la, 紳士漫畫, nhentai无任何关系.
如果在使用中发现问题, 请先确认是否为自己的设备问题, 然后再进行反馈.""": """
This app was developed for the purpose of communication and personal interest only, any content displayed is from the internet.
This project is not affiliated with Picacg, e-hentai.org, JmComic, hitomi.la, 紳士漫畫, nhentai.
If you find a problem while using it, please check if it's a problem with your device first, and then provide feedback.
""",
      "我已阅读并知晓": "I have read and understand",
      "更多设置": "More settings",
      "登录账号": "Login account",
      "进入APP": "Enter",
      "请先阅读使用须知": "Please read the Notice first",
      "要管理收藏夹, 请长按收藏夹标签或者使用鼠标右键": "To manage your favourites, long press on the favourites tab or use the right mouse button.",
    }
  };
}

extension ListTranslation on List<String> {
  List<String> _translate() {
    return List.generate(length, (index) => this[index].tl);
  }

  List<String> get tl => _translate();
}

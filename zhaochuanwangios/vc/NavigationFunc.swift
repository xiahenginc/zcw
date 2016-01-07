var uid = ""
var sessionId=""
var curpageid = ""
var curtab = 0
var defaultusername = ""
var defaultpassword = ""
var gloalphonenumber = ""

func navto_webinfo(uriid:String,title:String){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.indexNav?.pushViewController(dvc,animated: true)
}

//发布报价界面实现跳转  王朋  2016 1.5
//func navto_webinfoDetail(uriid:String,title:String){
//    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
//    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
//    dvc.detailname = uriid
//    dvc.title = title
//    dvc.paramdict["<%=uid%>"]=uid
//    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//    appDel.indexNav?.pushViewController(dvc,animated: true)


func navto_webinfo_personal(uriid:String,title:String){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
}

//王朋  2016 1.5 修改我的建议页面跳转到登录页面
func navto_webinfo_localadv(uriid:String,title:String){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.adviceNav?.pushViewController(dvc,animated: true)
}


func navto_webinfo_nofooter(uriid:String,title:String){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetailnofooter") as! WebDetailNoFooterViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.indexNav?.pushViewController(dvc,animated: true)
}

func navto_webinfo_nofooter_personal(uriid:String,title:String){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetailnofooter") as! WebDetailNoFooterViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
//    gloalphonenumber="&phone="
    dvc.paramdict["<%=phone%>"]=gloalphonenumber
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
}



func navto_myprofile(){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetailmyprofile") as! WebDetailMyProfileViewController
    dvc.detailname = "grzx"
    dvc.title = "我的资料"
    dvc.paramdict["<%=uid%>"]=uid
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
    
}

func navto_detail(uriid:String,title:String,paramdict: Dictionary<String,String>){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict = paramdict
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.indexNav?.pushViewController(dvc,animated: true)
    
}

func navtocbqg_detail_personal(uriid:String,title:String,paramdict: Dictionary<String,String>){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict = paramdict
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
    
}


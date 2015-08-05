var uid = ""
var sessionId=""
var curpageid = ""
var curtab = 0
var defaultusername = ""
var defaultpassword = ""

func navto_webinfo(uriid:String,title:String){
    var storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    var dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.indexNav?.pushViewController(dvc,animated: true)
}

func navto_webinfo_personal(uriid:String,title:String){
    var storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    var dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
}

func navto_webinfo_nofooter(uriid:String,title:String){
    var storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    var dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetailnofooter") as! WebDetailNoFooterViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.indexNav?.pushViewController(dvc,animated: true)
}

func navto_webinfo_nofooter_personal(uriid:String,title:String){
    var storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    var dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetailnofooter") as! WebDetailNoFooterViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
}

func navto_myprofile(){
    var storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    var dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetailmyprofile") as! WebDetailMyProfileViewController
    dvc.detailname = "grzx"
    dvc.title = "我的资料"
    dvc.paramdict["<%=uid%>"]=uid
    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
    
}

func navto_detail(uriid:String,title:String,var paramdict: Dictionary<String,String>){
    var storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    var dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict = paramdict
    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.indexNav?.pushViewController(dvc,animated: true)
    
}

func navtocbqg_detail_personal(uriid:String,title:String,var paramdict: Dictionary<String,String>){
    var storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    var dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict = paramdict
    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
    
}


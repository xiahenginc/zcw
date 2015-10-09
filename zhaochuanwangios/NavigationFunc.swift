var uid = ""
var sessionId=""
var curpageid = ""
var curtab = 0
var defaultusername = ""
var defaultpassword = ""

func navto_webinfo(uriid:String,title:String){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.indexNav?.pushViewController(dvc,animated: true)
}

func navto_webinfo_personal(uriid:String,title:String){
    let storyBoardTask = UIStoryboard(name:"infodetail",bundle:nil)
    let dvc = storyBoardTask.instantiateViewControllerWithIdentifier("webdetail") as! WebDetailViewController
    dvc.detailname = uriid
    dvc.title = title
    dvc.paramdict["<%=uid%>"]=uid
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDel.profileNav?.pushViewController(dvc,animated: true)
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


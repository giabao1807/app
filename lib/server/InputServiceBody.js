

//"6,B+E.9,A..-/,O,D,(,./(-A.>*B*K"
class InputServiceBody {

  constructor(clientSeq, WorkerName, ServiceName, InVal, Operation, AppLoginID, AppLoginPswd, OTP, AprStat, AprSeq, MakerDt, TimeOut) { //If model is class, you must define init() func. Struct's don't need
    this.CltVersion = glb_sv.configInfo.build_version ? glb_sv.configInfo.build_version : '3.0.0';
    // Nếu đã login thì mặc định set 2 tham số này từ userInfo
    // if let userInfo = Global.shared.userInfo {
    //     self.AppLoginID = userInfo.c0
    //     self.AppLoginPswd = userInfo.appLoginPassword // Encrypt  đã được gán sau khi login thành công
    //     self.AprID = self.AppLoginID
    //     self.AcntNo = userInfo.c0
    // }

    this.ClientSeq = clientSeq;//Utils.getClientSequence() ; //Client seq
    this.SecCode = glb_sv.activeCode || '---';//Sec code
    this.WorkerName = WorkerName;//Worker name values
    this.ServiceName = ServiceName;//Service name values
    this.TimeOut = TimeOut || 15; //TimeOut values
    this.MWLoginID = Platform.OS === 'android' ? 'Android' : 'IOS';
    this.MWLoginPswd = Platform.OS === 'android' ? ',+A,3-)-C.*,6,9,=+F*K.N*M.=+)+J,004' : "4,D+M,**K/O--+D-D-F-B,E+A,E,B,7";
    this.AppLoginID = AppLoginID || glb_sv.objShareGlb['sessionInfo']['userID'] || '';   //AppLoginID values
    this.AppLoginPswd = AppLoginPswd || glb_sv.objShareGlb['sessionInfo']['passID'] || '';   //AppLoginPswd values (Password has been encrypt)
    this.ClientSentTime = "0";  //ClientSentTime values
    this.Lang = glb_sv.language || "VI";   //Client language
    this.MdmTp = Platform.OS === 'android' ? '03' : '04';  //Media type
    this.InVal = InVal;
    this.TotInVal = InVal.length
    this.AprStat = AprStat || "N";   //Approve status
    this.Operation = Operation;   //Q: Query, I: Insert, U: Update, :anguished: Delete, E: Export, P: Print
    this.CustMgnBrch = "";     //Customer management branch
    this.CustMgnAgc = "";   //Customer management Agency
    this.BrkMgnBrch = "";    //BrokerInfo management branch
    this.BrkMgnAgc = "";    //BrokerInfo management Agency
    this.LoginBrch = '';    //Login branch
    this.LoginAgnc = '';    //Login Agency
  
    this.AprSeq = AprSeq || '';
    this.MakerDt = MakerDt || '';
    this.AprIP = "";
    this.AprID = "";
    this.AprAmt = "";
  
    this.IPPrivate = "192.168.1.113";
  
    // #if os(iOS)
    //   PCName:String = DeviceInfoUtils.instance.name + DeviceInfoUtils.instance.systemName
    // #elseif os(OSX)
    //   PCName:String = Host.current().localizedName!
    // #endif
  
    this.Otp = OTP ? OTP : (glb_sv.objShareGlb['sessionInfo']['Otp'] || "")

    this.AcntNo = '';
    this.SubNo = '';
    this.BankCd = '';
    this.PCName = glb_sv.deviceName || '';
    // this.IPPrivate = '1.1.1.1';
    // this.IPPublic = '1.1.1.1';
    this.SessionID = glb_sv.objShareGlb.sessionInfo.sessionId || '';
  }
}

export default InputServiceBody;

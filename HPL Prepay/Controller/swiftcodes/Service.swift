 import Foundation 
public class Service {
 public var Url:String = "http://tsspdclservice.hplprepayvs.com/Service.asmx"
 public var Host:String = "tsspdclservice.hplprepayvs.com"
public func dataToBase64(data:NSData)->String{
        
        let result = data.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return result;
    }
    public func dataToBase64(data: Data)->String {
        let result = data.base64EncodedString()
        return result
    }
    public func byteArrayToBase64(data:[UInt])->String{
        let nsdata = NSData(bytes: data, length: data.count)
        let data  = Data.init(referencing: nsdata)
        if let str = String.init(data: data, encoding: String.Encoding.utf8){
            return str
        }
        return "";
    }
    public func timeToString(date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    public func dateToString(date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    public func base64ToByteArray(base64String: String) -> [UInt8] {
        let data = Data.init(base64Encoded: base64String)
        let dataCount = data!.count
        var bytes = [UInt8].init(repeating: 0, count: dataCount)
        data!.copyBytes(to: &bytes, count: dataCount)
        return bytes
    }
    func stringFromXMLString(xmlToParse:String)->String {
        do
        {
            let xml = SWXMLHash.lazy(xmlToParse)
            let xmlResponse : XMLIndexer? = xml.children.first?.children.first?.children.first
            let xmlResult: XMLIndexer?  = xmlResponse?.children.last
            
            let xmlElement = xmlResult?.element
            let str = xmlElement?.text
            UserDefaults.standard .setValue(str, forKey: "xmlData")

            let xmlElementFirst = xmlElement?.children[0] as!TextElement
            return xmlElementFirst.text
        }
        catch
        {
        }
        //NOT IMPLETEMENTED!
        var returnValue:String!
        return returnValue
    }
    func stringFromXML(data:Data)-> String
    {
        
        let xmlToParse :String? = String.init(data: data, encoding: String.Encoding.utf8)
        if xmlToParse == nil {
            return ""
        }
        if xmlToParse!.count == 0 {
            return ""
        }
        let  stringVal = stringFromXMLString(xmlToParse:  xmlToParse!)
        return stringVal
        
    }
    func stringArrFromXMLString(xmlToParse :String)->[String?]{
        let xml  = SWXMLHash.lazy(xmlToParse)
        let xmlRoot  = xml.children.first
        let xmlBody = xmlRoot?.children.last
        let xmlResponse : XMLIndexer? =  xmlBody?.children.first
        let xmlResult : XMLIndexer?  = xmlResponse?.children.last
        
        var strList = [String?]()
        let childs = xmlResult!.children
        for child in childs {
            let text = child.element?.text
            strList.append(text)
        }
        
        return strList
    }
    func stringArrFromXML(data:Data)->[String?]{
        let xmlToParse :String? = String.init(data: data, encoding: String.Encoding.utf8)
        if xmlToParse == nil {
            return [String?]()
        }
        if xmlToParse!.count == 0 {
            return [String?]()
        }
        
        let  stringVal = stringArrFromXMLString(xmlToParse:  xmlToParse!)
        return stringVal
    }
    
    func byteArrayToBase64(bytes: [UInt8]) -> String {
        
        let data = Data.init(bytes: bytes)
        let base64Encoded = data.base64EncodedString()
        return base64Encoded;
       
    }
    
    func base64ToByteArray(base64String: String) -> [UInt8]? {
        if let data = Data.init(base64Encoded: base64String){
            var bytes = [UInt8](repeating: 0, count: data.count)
            data.copyBytes(to: &bytes, count: data.count)
            return bytes;
        }
        return nil // Invalid input
    }
  
public func HelloWorld()-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<HelloWorld xmlns=\"http://tempuri.org/\">"
soapReqXML += "</HelloWorld>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/HelloWorld"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func bal_enquiry(Consumer_number:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<bal_enquiry xmlns=\"http://tempuri.org/\">"
soapReqXML += "<Consumer_number>"
soapReqXML += Consumer_number
soapReqXML += "</Consumer_number>"
soapReqXML += "</bal_enquiry>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/bal_enquiry"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func consumer_complaint(Consumer_number:String, Complaint_msg:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<consumer_complaint xmlns=\"http://tempuri.org/\">"
soapReqXML += "<Consumer_number>"
soapReqXML += Consumer_number
soapReqXML += "</Consumer_number>"
soapReqXML += "<Complaint_msg>"
soapReqXML += Complaint_msg
soapReqXML += "</Complaint_msg>"
soapReqXML += "</consumer_complaint>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/consumer_complaint"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func complaint_reqhistory(Consumer_number:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<complaint_reqhistory xmlns=\"http://tempuri.org/\">"
soapReqXML += "<Consumer_number>"
soapReqXML += Consumer_number
soapReqXML += "</Consumer_number>"
soapReqXML += "</complaint_reqhistory>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/complaint_reqhistory"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func recharge_history(Consumer_number:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<recharge_history xmlns=\"http://tempuri.org/\">"
soapReqXML += "<Consumer_number>"
soapReqXML += Consumer_number
soapReqXML += "</Consumer_number>"
soapReqXML += "</recharge_history>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/recharge_history"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func Billing_history(Consumer_number:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<Billing_history xmlns=\"http://tempuri.org/\">"
soapReqXML += "<Consumer_number>"
soapReqXML += Consumer_number
soapReqXML += "</Consumer_number>"
soapReqXML += "</Billing_history>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/Billing_history"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func Account_summary(Consumer_number:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<Account_summary xmlns=\"http://tempuri.org/\">"
soapReqXML += "<Consumer_number>"
soapReqXML += Consumer_number
soapReqXML += "</Consumer_number>"
soapReqXML += "</Account_summary>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/Account_summary"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func signal_strength(modemNo:String, strength:String, port:String){
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<signal_strength xmlns=\"http://tempuri.org/\">"
soapReqXML += "<modemNo>"
soapReqXML += modemNo
soapReqXML += "</modemNo>"
soapReqXML += "<strength>"
soapReqXML += strength
soapReqXML += "</strength>"
soapReqXML += "<port>"
soapReqXML += port
soapReqXML += "</port>"
soapReqXML += "</signal_strength>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/signal_strength"

   SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
}
public func recharge_details(ConsumerNo:String, rechargeAmount:Double, rechargeDate:Date, transactionID:String)-> Int{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<recharge_details xmlns=\"http://tempuri.org/\">"
soapReqXML += "<ConsumerNo>"
soapReqXML += ConsumerNo
soapReqXML += "</ConsumerNo>"
soapReqXML += "<rechargeAmount>"
soapReqXML += String(rechargeAmount)
soapReqXML += "</rechargeAmount>"
soapReqXML += "<rechargeDate>"
soapReqXML += dateToString( date : rechargeDate)
soapReqXML += "</rechargeDate>"
soapReqXML += "<transactionID>"
soapReqXML += transactionID
soapReqXML += "</transactionID>"
soapReqXML += "</recharge_details>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/recharge_details"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML( data : responseData);
 if strVal == nil {

    return  0
 }
 let returnValue:Int = strVal!.toInt()!
   return returnValue
}
public func ZeroHr_calculation(meterSlno:String, Energy:String, rtc:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<ZeroHr_calculation xmlns=\"http://tempuri.org/\">"
soapReqXML += "<meterSlno>"
soapReqXML += meterSlno
soapReqXML += "</meterSlno>"
soapReqXML += "<Energy>"
soapReqXML += Energy
soapReqXML += "</Energy>"
soapReqXML += "<rtc>"
soapReqXML += rtc
soapReqXML += "</rtc>"
soapReqXML += "</ZeroHr_calculation>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/ZeroHr_calculation"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func Connected_meter(SerialNo:String, RTC:String, modemSNo:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<Connected_meter xmlns=\"http://tempuri.org/\">"
soapReqXML += "<SerialNo>"
soapReqXML += SerialNo
soapReqXML += "</SerialNo>"
soapReqXML += "<RTC>"
soapReqXML += RTC
soapReqXML += "</RTC>"
soapReqXML += "<modemSNo>"
soapReqXML += modemSNo
soapReqXML += "</modemSNo>"
soapReqXML += "</Connected_meter>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/Connected_meter"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
public func ack_cmd_meterToServer(ackdata:String)-> String{
   var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

soapReqXML  += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
soapReqXML  += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
soapReqXML  += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
soapReqXML += " <soap:Body>"
soapReqXML += "<ack_cmd_meterToServer xmlns=\"http://tempuri.org/\">"
soapReqXML += "<ackdata>"
soapReqXML += ackdata
soapReqXML += "</ackdata>"
soapReqXML += "</ack_cmd_meterToServer>"
soapReqXML += "</soap:Body>"
soapReqXML += "</soap:Envelope>"

   let soapAction :String = "http://tempuri.org/ack_cmd_meterToServer"

   let responseData:Data = SoapHttpClient.callWS(Host : self.Host,WebServiceUrl:self.Url,SoapAction:soapAction,SoapMessage:soapReqXML)
 let strVal :String? = stringFromXML(data : responseData);
 if strVal == nil {

    return  ""
 }
 let returnValue:String = strVal!
   return returnValue
}
}

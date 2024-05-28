class Attachment{

    String AttachmentName;
    String AttachmentDescription;
    String AttachmentPart;
    String AttachmentMake;
    double AttachmentPrice;
    int AttachmentPiccatiny_Top;
    int AttachmentPiccatiny_Bottom;
    int AttachmentPiccatiny_Left;
    int AttachmentPiccatiny_Right;
    int Attachment_AttachesToRail;
    int Attachment_AttachesToDovetail;

    Attachment(
      this.AttachmentName,
      this.AttachmentDescription,
      this.AttachmentPart,
      this.AttachmentMake,
      this.AttachmentPrice,
      this.AttachmentPiccatiny_Top,
      this.AttachmentPiccatiny_Bottom,
      this.AttachmentPiccatiny_Left,
      this.AttachmentPiccatiny_Right,
      this.Attachment_AttachesToRail,
      this.Attachment_AttachesToDovetail
    );

    factory Attachment.fromJson(Map<dynamic, dynamic> json){

      return Attachment(
        json["attachmentName"],
        json["attachmentDescription"],
        json["attachmentPart"],
        json["attachmentMake"],
        json["attachmentPrice"],
        json["attachmentPiccatiny_Top"],
        json["attachmentPiccatiny_Bottom"],
        json["attachmentPiccatiny_Left"],
        json["attachmentPiccatiny_Right"],
        json["attachment_AttachesToRail"],
        json["attachment_AttachesToDovetail"],
        
      );
    }

}
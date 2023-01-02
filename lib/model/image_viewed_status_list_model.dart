import 'dart:convert';

// List<ImageViewedStatusListModel> imageViewedStatusListModelFromJson(
//         String str) =>
//     List<ImageViewedStatusListModel>.from(
//         json.decode(str).map((x) => ImageViewedStatusListModel.fromJson(x)));
//
// String imageViewedStatusListModelToJson(
//         List<ImageViewedStatusListModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ImageViewedStatusListModel {
//   ImageViewedStatusListModel({
//     this.frontImage,
//     this.chaseImage,
//     this.rcFront,
//     this.rcBack,
//     this.insurance,
//     this.fc,
//     this.profilePic,
//     this.aadharFront,
//     this.aadharBack,
//     this.licenseFront,
//     this.licenseBack,
//     this.ownerAadharFront,
//     this.ownerAadharBack,
//     this.panCard,
//     this.passbook,
//     this.rentalAgreement1,
//     this.rentalAgreement2,
//   });
//
//   bool frontImage;
//   bool chaseImage;
//   bool rcFront;
//   bool rcBack;
//   bool insurance;
//   bool fc;
//   bool profilePic;
//   bool aadharFront;
//   bool aadharBack;
//   bool licenseFront;
//   bool licenseBack;
//   bool ownerAadharFront;
//   bool ownerAadharBack;
//   bool panCard;
//   bool passbook;
//   bool rentalAgreement1;
//   bool rentalAgreement2;
//
//   factory ImageViewedStatusListModel.fromJson(Map<String, dynamic> json) =>
//       ImageViewedStatusListModel(
//         frontImage: json["frontImage"],
//         chaseImage: json["chaseImage"],
//         rcFront: json["rcFront"],
//         rcBack: json["rcBack"],
//         insurance: json["insurance"],
//         fc: json["fc"],
//         profilePic: json["profilePic"],
//         aadharFront: json["aadharFront"],
//         aadharBack: json["aadharBack"],
//         licenseFront: json["licenseFront"],
//         licenseBack: json["licenseBack"],
//         ownerAadharFront: json["ownerAadharFront"],
//         ownerAadharBack: json["ownerAadharBack"],
//         panCard: json["panCard"],
//         passbook: json["passbook"],
//         rentalAgreement1: json["rentalAgreement1"],
//         rentalAgreement2: json["rentalAgreement2"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "frontImage": frontImage,
//         "chaseImage": chaseImage,
//         "rcFront": rcFront,
//         "rcBack": rcBack,
//         "insurance": insurance,
//         "fc": fc,
//         "profilePic": profilePic,
//         "aadharFront": aadharFront,
//         "aadharBack": aadharBack,
//         "licenseFront": licenseFront,
//         "licenseBack": licenseBack,
//         "ownerAadharFront": ownerAadharFront,
//         "ownerAadharBack": ownerAadharBack,
//         "panCard": panCard,
//         "passbook": passbook,
//         "rentalAgreement1": rentalAgreement1,
//         "rentalAgreement2": rentalAgreement2,
//       };
// }
//
List<ImageViewedStatusListModel> imageViewedStatusListModelArray;

class ImageViewedStatusListModel {
  ImageViewedStatusListModel({
    this.frontImage,
    this.chaseImage,
    this.rcFront,
    this.rcBack,
    this.insurance,
    this.fc,
    this.profilePic,
    this.aadharFront,
    this.aadharBack,
    this.licenseFront,
    this.licenseBack,
    this.ownerAadharFront,
    this.ownerAadharBack,
    this.panCard,
    this.passbook,
    this.rentalAgreement1,
    this.rentalAgreement2,
  });

  bool frontImage;
  bool chaseImage;
  bool rcFront;
  bool rcBack;
  bool insurance;
  bool fc;
  bool profilePic;
  bool aadharFront;
  bool aadharBack;
  bool licenseFront;
  bool licenseBack;
  bool ownerAadharFront;
  bool ownerAadharBack;
  bool panCard;
  bool passbook;
  bool rentalAgreement1;
  bool rentalAgreement2;
}

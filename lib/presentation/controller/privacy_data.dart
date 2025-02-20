import 'dart:core';

import 'package:intl/intl.dart';
import 'package:my_precious_homepage/presentation/config.dart';

abstract class PrivacyData {
  // Updated.
  static DateTime updatedDate = DateTime(2024, 3, 12);
  static String getFormattedOnUpdatedTitle(AppLocale locale) {
    return "Updated on ${DateFormat.yMd(locale.localeName).format(updatedDate)}.";
  }

  // Summary.
  static String summaryTitle = "Summary";
  static String summaryDescription =
      "$appName do not own your data and do not sell your personal information.";

  // Policy.
  static String policyTitle = "Policy";
  static String policyDescriptionP1 =
      "Mi3van built the $appName app as an App with In-app purchases "
      "without ads. This SERVICE is provided by Mi3van at no cost and is "
      "intended for use as is, but has optional In-app purchases.";
  static String policyDescriptionP2 =
      "$appName app is only available for download from app stores made "
      "available by authorized app channel providers (for example: Google Play, "
      "Amazon Appstore, Huawei AppGallery or such other app store as we may "
      "authorize - next as “App Channel Provider”). If you make any in-app "
      "purchases on a $appName app, the privacy notices of the relevant App "
      "Channel Provider will also apply in respect of the personal data it "
      "controls and processes.";
  static String policyDescriptionP3 =
      "This page is used to inform visitors regarding our policies "
      "with the collection, use, and disclosure of Personal Information if "
      "anyone decided to use our Service. We are obliged to maintain your "
      "privacy on the Internet. Our privacy policy is based on The General Data "
      "Protection Regulation (";
  static String policyGdprLinkTitle = "GDPR";
  static String policyDescriptionP3_2 = ").";
  static String policyDescriptionP4 = "If you choose to use our Service, "
      "then you agree to the collection and use of information in relation to "
      "this policy. The Personal Information that we collect is used for "
      "providing and improving the Service, and for other actions listed below.";

  // Personal data.
  static String personalDataTitle = "Personal data storage and processing";
  static String personalDataDescription =
      "We collect and process your personal data only with your "
      "willing consent. With your permission, we can collect and process the "
      "following data: first name, last name, nickname and email address. The "
      "collection and processing of your personal information is carried out in "
      "accordance with the laws of the European Union and the United States.";

  // Data storage.
  static String dataStorageTitle = "Data storage, alteration, and removal";
  static String dataStorageDescriptionP1 =
      "The user who has provided our Service with their personal data "
      "has the right for their alteration and removal, as well as the right to "
      "recall the agreement to data processing. Time during which your personal "
      "data will be stored is: 6 months from the last use of the Service. After "
      "finishing with the processing of your personal data, the website's "
      "administration will permanently delete it. To access your personal data, "
      "you can contact us at: ";
  // At this point put email.
  static String dataStorageDescriptionP2 =
      ". We will be able to pass your data to a third party only with your "
      "willing consent. If the data was transferred to a third party, which is "
      "not associated with our organization, we cannot perform any changes to "
      "that data.";

  // Processing of visiting.
  static String processingTitle = "Processing of visiting technical data";
  static String processingDescriptionP1 =
      "No records of your IP address, time of visit, operational "
      "system or other technical information are stored in the database when you"
      " visit this site. From the browser settings, only the language that is "
      "necessary for the correct display of site content is taken. Other "
      "browser settings are not processed or saved in any way.";
  static String processingDescriptionP2 =
      "It is impossible to identify the person of the visitor using "
      "this data.";

  // Children’s personal.
  static String childrenTitle = "Children's personal information";
  static String childrenDescriptionP1 =
      "Each $appName app is intended for use by children under adult "
      "supervision. We do not knowingly process children's personal data. Any "
      "feature of a $appName app that allows in-app purchases is only intended "
      "for adults, and is operated by the relevant App Channel Provider.";
  static String childrenDescriptionP2 =
      "We strive to comply with the United States Children's Online "
      "Privacy Protection Act (";
  static String childrenCoppaLinkTitle = "COPPA";
  static String childrenDescriptionP2_2 = ").";

  // Cookies.
  static String cookiesTitle = "Cookies";
  static String cookiesDescriptionP1 =
      "Cookies are files with a small amount of data that are "
      "commonly used as anonymous unique identifiers. These are sent to your "
      "browser from the websites that you visit and are stored on your device's "
      "internal memory.";
  static String cookiesDescriptionP2 =
      "This Service does not use these “cookies” explicitly. However, "
      "the app may use third party code and libraries that use “cookies” to "
      "collect information and improve their services. You have the option to "
      "either accept or refuse these cookies and know when a cookie is being "
      "sent to your device. If you choose to refuse our cookies, you may not be "
      "able to use some portions of this Service. You can learn more about Cookie ";
  static String cookiesLinkTitle = "here";
  static String cookiesDescriptionP2_2 = ".";

  // Log Data
  static String logDataTitle = "Log Data";
  static String logDataDescription =
      "We want to inform you that whenever you use our Service, in "
      "the case of an error in the app we collect data and information (through "
      "third party products) on your phone called Log Data. This Log Data may "
      "include information such as your device Internet Protocol (“IP”) "
      "address, device name, operating system version, the configuration of the "
      "app when utilizing our Service, the time and date of your use of the "
      "Service, and other statistics.";

  // Other services.
  static String servicesTitle = "Processing of data by other services";
  static String servicesDescriptionP1 =
      "This service uses third-party services, which perform data "
      "collecting, independent from us. Links to the privacy policy of the "
      "third party service-providers used by the Service:";
  static String servicesDescriptionP2 = "- ";
  static String servicesGoogleLinkTitle = "Google Play Services";
  static String servicesDescriptionP2_2 = " (Google Drive sign in).";

  static String servicesDescriptionP3 =
      "Data collected by these services may be provided to other "
      "services within those organizations. They can use the data for "
      "advertising personalization of their own advertising network. You can "
      "learn about user agreements of those organizations on their websites. "
      "You can also refuse their collection of your personal data. We do not "
      "pass any personal data to other organizations or services, which are not "
      "listed in this privacy policy. As an exception, the collected data may "
      "be provided on a lawful request of state authorities that are authorized "
      "to request such information.";

  // Comply with other services.
  static String complyWithServicesTitle =
      "Processing of data in comply with other services";
  static String complyWithServicesDescriptionP1 =
      "$appName use and transfer of information received from Google "
      "APIs to any other app will adhere to ";
  static String complyWithServicesGoogleLinkTitle = "Google API Services User "
      "Data Policy";
  static String complyWithServicesDescriptionP2 = ", including the Limited Use "
      "requirements.";

  // Links.
  static String linksTitle = "Links to Other websites";
  static String linksDescription =
      "This Service may contain links to other websites. If you click "
      "on a third-party link, you will be directed to that site. Note that "
      "these external sites are not operated by us. Therefore, we strongly "
      "advise you to review the Privacy Policy of these websites. We have no "
      "control over and assume no responsibility for the content, privacy "
      "policies, or practices of any third-party sites or services.";

  // Security.
  static String securityTitle = "Security";
  static String securityDescription =
      "We value your trust in providing us your Personal Information, "
      "thus we are striving to use commercially acceptable means of protecting "
      "it. But remember that no method of transmission over the internet, or "
      "method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.";

  // Changes.
  static String changesTitle = "Changes to This Privacy Policy";
  static String changesDescription =
      "We may update our Privacy Policy from time to time. Thus, you "
      "are advised to review this page periodically for any changes. We will "
      "notify you of any changes by posting the new Privacy Policy on this page.";

  // Contacts.
  static String contactsTitle = "Contact Us";
  static String contactsDescriptionP1 =
      "If you have any questions or suggestions about our Privacy "
      "Policy, do not hesitate to contact us at ";
  // At this point put email
  static String contactsDescriptionP1_1 =
      ". If you do not agree with this privacy policy, you cannot use our Service.";
}

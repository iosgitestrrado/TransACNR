//
//  CommanConstants.swift
//  Azool
//
//  Created by DON PAUL PM on 15/05/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import Foundation



/***************************URLService*************************************/
let TransACNRBaseTestUrl = "http://202.88.244.249:7089/v1/"
let TransACNRLiveImgUrl = "http://43.224.136.184:7058/img/"
let newSharedInstance = SharedInstance.sharedData

/***************************UserManagement*************************************/
let TransACNRLogin = "UserManagement/ACNRAdminLogin"
let TransACNRMenus = "UserManagement/GetMenus"

/***************************VehicleService*************************************/
let TransACNRServiceReg = "VehicleService/GetServiceEnquiryPageLoadsetails"
let TransACNRSaveCustomerDetails = "VehicleService/SaveCustomerDetails"
let TransACNRSaveVehicleDetails = "VehicleService/SaveVehicleDetails"
let TransACNRServiceList = "VehicleService/ServiceList"
let TransACNRServiceEnquiryList = "VehicleService/ServiceEnquiryList"
let TransACNRJobCardHistoryList = "VehicleService/JobCardHistoryList"
let TransACNRCompleteBillableList = "VehicleService/Get_Service_CompleteBillable"
let TransACNRCompleteFinanceList = "VehicleService/Get_Service_CompleteFinance"
let TransACNREditOrViewServiceEnquiry = "VehicleService/EditOrViewServiceEnquiry"
let TransSaveServiceEnquiry = "VehicleService/SaveServiceEnquiry"
let TransUpdateServiceEnquiry = "VehicleService/UpdateServiceEnquiry"
let TransAssignTechnician = "VehicleService/AssignTechnicians"
let TransACNRAutoCompleteByCustomer = "VehicleService/AutoCompleteByCustomerName"
let TransACNRAutoCompleteBySerialNumber = "VehicleService/AutoCompleteBySerialNumber"
let TransACNRAutoCompleteByVehicleNumber = "VehicleService/AutoCompleteByVehicleNumber"
let TransACNRAllTechnicianByBranch = "VehicleService/GetAllTechnicianByBranch"
let TransACNRVehicleServiceActiveOrInactive = "VehicleService/ActiveOrInactive"
let TransACNRDeleteServiceEnquiry = "VehicleService/DeleteServiceEnquiry"
let TransACNRVehicleServiceComplete = "VehicleService/VehicleServiceComplete"
let TransACNRGetFinanceSearchReport = "VehicleService/Get_FinanceSearchReport"
let TransACNRNumberForVehicleOwnerShip = "VehicleService/AutoCompleteByVehicleNumberForVehicleOwnerShip"
let TransACNRGetVehicleOwnerShipSearching = "VehicleService/GetVehicleOwnerShipSearching"
let TransACNRGetJobCardDetails = "VehicleService/GetJobCardDetails"
let TransACNRGetFinanceDetailsOnPageLoad = "VehicleService/GetFinanceDetailsOnPageLoad"




/***************************Order*************************************/
let TransACNRChangeOwnerShip = "Order/ChangeOwnerShip"
let TransACNROrderTransferlist = "Order/GetallOrderTransferByBranch"
let TransACNROrderPendingList = "Order/GetOrderPendingList"
let TransACNRVehicleWarrantyList = "Order/GetVehicleWarrantyList"
let TransACNROrderAMCList = "Order/GetAMCList"
let TransACNROrderPaymentList = "Order/Get_Payment_List"
let TransACNROrderPaymentStatus = "Order/GetOrderPaymentStatus"
let TransACNROrderCompleteList = "Order/GetOrderCompleteList"
let TransACNROrderList = "Order/GetOrderList"
let TransACNRPaymentDueReport = "Order/GetPaymentDueReport"
let TransACNROrderListReport = "Order/GetOrderListReport"
let TransACNRInstallationForAppproval = "Order/GetInstallationForAppprovalAndStatus"
let TransACNROrderListDetailsReport = "Order/GetOrderListDetailsReport"
let TransACNROrderPaymentCollectionReport = "Order/GetPaymentCollectionReport"
let TransACNROrderCompleteSubOrder = "Order/GetOrderCompleteSubOrder"

/***************************Marketing*************************************/
let TransACNRNewEnquiry = "Marketing/GetEnquiryCodes"
let TransACNREnquiryCustomerDetails = "VehicleService/GetServiceEnquiryPageLoadsetails"
let  TransACNRVehicleChassisModelDetails = "Marketing/Getall_ChasisiandModel"
let TransACNRVehicleWheelBase  = "Marketing/GetallWheelBase"
let TransACNRUnitDetail = "Marketing/GetUnitInformation"


/***************************DispatchRequest*************************************/
let TransACNRDispatchRequestList = "DispatchRequest/GetAll_DispatchRequestList"

















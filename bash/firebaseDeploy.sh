#!/bin/bash

firebase deploy --only "functions:accountTriggers,functions:endToEndTestingUtils,functions:inboxService"
firebase deploy --only "functions:quoteTriggers,functions:sampleTriggers"
firebase deploy --only "functions:productRequestTriggers"
firebase deploy --only "functions:dataPipeline,functions:onCall-rebuildBuyerInboxForRequestId,functions:onCall-rebuildQuoteInboxForRequestId"

firebase deploy --only "functions:api-addToOrg,functions:api-assignProductRequestToOwnOrg,functions:api-cleanUpTestingData,functions:api-createOrganization,functions:api-deleteMember,functions:api-deleteOrg,functions:api-deleteRequest,functions:api-deleteUser"
firebase deploy --only "functions:api-getAssignedRequestIdsForOrg,functions:api-getGlobalConstants,functions:api-getInboundRequestsForSupplier,functions:api-getIncompleteRequests,functions:api-getInvitedUsers,functions:api-getMessages,functions:api-getNegotiationDispositions,functions:api-getOrgMembersProfiles"
firebase deploy --only "functions:api-getOrgProfiles,functions:api-getOrganizationById,functions:api-getOrganizations,functions:api-getOutboundRequestsForBuyer,functions:api-getQuote,functions:api-getQuoteIdsForRequests,functions:api-getQuoteWithPublicToken,functions:api-getRequest"

firebase deploy --only "functions:api-getRequestIdsAuthoredByOrg,functions:api-getRequestWithPublicToken,functions:api-getRequests,functions:api-inviteUsersToOrg,functions:api-makeAdmin,functions:api-manageAdminStatusInOrg,functions:api-quickCreateOrg,functions:api-requestMoreSuppliers,functions:api-sendQuoteWriteToVAP"
firebase deploy --only "functions:api-saveQuote,functions:api-shareProductRequest,functions:api-shareQuote,functions:api-addUserToOrgIfInvited,functions:api-addSalesforceStatusToRequest,functions:api-updateNegotiationDisposition,functions:api-addNegotiationDocument,functions:api-generateBuyerReportForOrg,functions:api-assignRequestToSupplierOrgs"
firebase deploy --only "functions:notifications-notifyBuyerWhenQuoteUpdated,functions:notifications-notifyOnDeclineQuote,functions:notifications-notifyOnNewMessage,functions:notifications-notifyOnNewProductRequestAssignment,functions:notifications-notifyOnNewSampleRequest"

firebase deploy --only "functions:functions:notifications-notifySupplierWhenRequestUpdated,functions:notifications-notifyonSampleRequestUpdate,functions:notifications-onReachDisclosurePointDuringNegotiation,functions:notifications-onReachDisclosurePointOnQuoteCreation,functions:notifications-onSampleRequestNegotiationDispositionUpdate,functions:api-healthCheck"
firebase deploy --only firestore
firebase deploy --only storage

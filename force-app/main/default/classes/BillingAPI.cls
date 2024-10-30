@RestResource(urlMapping='/Billing/*')
global with sharing class BillingAPI {

    @HttpPost
    global static ResponseWrapper createPaymentMethod() {
        //TODO - check if there is an existing card with autopay, else set this one

        //test asdsd
        RestRequest req = RestContext.request;
        Blob body = req.requestBody;
        String paymentMethodRequest = body.toString();
        System.debug('paymentMethodRequest: ' + paymentMethodRequest);
        ResponseWrapper response = new ResponseWrapper();
        try {
            String paymentMethodReturn = blng.HostedPaymentPageTransactionAPI.savePaymentMethod(paymentMethodRequest);
            response.success = true;
            response.successMessage = paymentMethodReturn;
        } catch (Exception ex) {
            response.success = false;
            response.errorMessage = ex.getMessage();
        }
        return response;
    }

    global class ResponseWrapper {
        public Boolean success;
        public String successMessage;
        public String errorMessage;
    }
}

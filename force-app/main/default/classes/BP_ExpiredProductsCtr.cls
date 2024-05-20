/**
 * @File Name          : BP_ExpiredProductsCtr.cls
 * @Description        : 
 * @Author             : Raul Valenzuela Hernandez rvalenzh@everis.com
 * @Group              : 
 * @Last Modified By   : rvalenzh@everis.com
 * @Last Modified On   : 16/01/2019, 16:40:00 PM
 * @Modification Log   : 
 * Ver       Date            Author      		 Modification
 * 1.0    11/26/2019   rvalenzh@everis.com     Initial Version
**/
public without sharing class BP_ExpiredProductsCtr {

    //METODO GET EXPIRED PRODUCTS
@AuraEnabled
    
//METODO
    public static Account getExpiredProducts(Id accID){
    Account iAccount = [SELECT Id,name, SourceSystemId__c, CustomerID__c FROM Account WHERE Id =:accID LIMIT 1];
    
    System.debug('CUENTA'+iAccount);

    HTTPResponse res = new HTTPResponse();
    res = createHttpRequestEProduct(iAccount.SourceSystemId__c);
   // System.debug(' ** iAccount.SourceSystemId__c: ' + iAccount.SourceSystemId__c );
    
    String jsonPrueba = '[{\"product\":{\"productNumber\":\"000772558795\",\"productDescription\":\"COBRANZA LIBRE\"},\"expirationDays\":1177,\"amount\":2500,\"tradeAmount\":8272.5,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000772557594\",\"productDescription\":\"COBRANZA LIBRE\"},\"expirationDays\":1045,\"amount\":1000,\"tradeAmount\":3309,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000772558159\",\"productDescription\":\"COBRANZA LIBRE\"},\"expirationDays\":1198,\"amount\":1000,\"tradeAmount\":3309,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000852824963\",\"productDescription\":\"FINANCIACION-IMPORTACIONES\"},\"expirationDays\":916,\"amount\":1500000,\"tradeAmount\":1500000,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":253,\"amount\":144594.56,\"tradeAmount\":144594.56,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":251,\"amount\":143016.7,\"tradeAmount\":143016.7,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":248,\"amount\":131354.96,\"tradeAmount\":131354.96,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":300,\"amount\":123145.27,\"tradeAmount\":123145.27,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":290,\"amount\":123145.27,\"tradeAmount\":123145.27,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":267,\"amount\":110330,\"tradeAmount\":110330,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":290,\"amount\":102621.06,\"tradeAmount\":102621.06,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":281,\"amount\":102621.06,\"tradeAmount\":102621.06,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":251,\"amount\":96589.41,\"tradeAmount\":96589.41,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":247,\"amount\":92677.2,\"tradeAmount\":92677.2,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":287,\"amount\":82747.5,\"tradeAmount\":82747.5,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":281,\"amount\":82747.5,\"tradeAmount\":82747.5,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":281,\"amount\":82747.5,\"tradeAmount\":82747.5,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":269,\"amount\":82747.5,\"tradeAmount\":82747.5,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":267,\"amount\":82747.5,\"tradeAmount\":82747.5,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":300,\"amount\":82096.85,\"tradeAmount\":82096.85,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":290,\"amount\":82096.85,\"tradeAmount\":82096.85,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":251,\"amount\":81015.46,\"tradeAmount\":81015.46,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":253,\"amount\":79437.6,\"tradeAmount\":79437.6,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":290,\"amount\":61572.64,\"tradeAmount\":61572.64,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":261,\"amount\":56530.61,\"tradeAmount\":56530.61,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":251,\"amount\":54444.96,\"tradeAmount\":54444.96,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":49158.8,\"tradeAmount\":49158.8,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":49158.8,\"tradeAmount\":49158.8,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":269,\"amount\":47006.48,\"tradeAmount\":47006.48,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":268,\"amount\":45058.89,\"tradeAmount\":45058.89,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":42636.47,\"tradeAmount\":42636.47,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":251,\"amount\":40437.13,\"tradeAmount\":40437.13,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":38843.24,\"tradeAmount\":38843.24,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":35984.1,\"tradeAmount\":35984.1,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":290,\"amount\":34288.91,\"tradeAmount\":34288.91,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":31584.12,\"tradeAmount\":31584.12,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":262,\"amount\":27582.5,\"tradeAmount\":27582.5,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":261,\"amount\":24609.96,\"tradeAmount\":24609.96,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":24356.38,\"tradeAmount\":24356.38,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":24356.38,\"tradeAmount\":24356.38,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":251,\"amount\":23919.96,\"tradeAmount\":23919.96,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":286,\"amount\":19421.62,\"tradeAmount\":19421.62,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":286,\"amount\":19421.62,\"tradeAmount\":19421.62,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":287,\"amount\":16776.06,\"tradeAmount\":16776.06,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":295,\"amount\":13591.95,\"tradeAmount\":13591.95,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":302,\"amount\":11751.62,\"tradeAmount\":11751.62,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":297,\"amount\":11331.89,\"tradeAmount\":11331.89,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":290,\"amount\":11331.89,\"tradeAmount\":11331.89,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":262,\"amount\":11331.89,\"tradeAmount\":11331.89,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":297,\"amount\":10187.24,\"tradeAmount\":10187.24,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":297,\"amount\":10187.24,\"tradeAmount\":10187.24,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001079711848\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":262,\"amount\":6791.49,\"tradeAmount\":6791.49,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065069022\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":269,\"amount\":5665.95,\"tradeAmount\":5665.95,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":302,\"amount\":3868.64,\"tradeAmount\":3868.64,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"001065068395\",\"productDescription\":\"NET FACTORING\"},\"expirationDays\":302,\"amount\":1026.21,\"tradeAmount\":1026.21,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"000695712802\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1617,\"amount\":500000,\"tradeAmount\":1654500,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000698280083\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":26,\"amount\":150000,\"tradeAmount\":496350,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000695712764\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1617,\"amount\":150000,\"tradeAmount\":496350,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000695712870\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1616,\"amount\":150000,\"tradeAmount\":150000,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"000698540190\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1407,\"amount\":120000,\"tradeAmount\":120000,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"000697093620\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1290,\"amount\":50000,\"tradeAmount\":50000,\"currencyCode\":\"PEN\"},{\"product\":{\"productNumber\":\"000695712780\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1617,\"amount\":10000,\"tradeAmount\":33090,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000695712853\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1616,\"amount\":1500,\"tradeAmount\":4963.5,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000695712772\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1617,\"amount\":1000,\"tradeAmount\":3309,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000698539664\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1469,\"amount\":1000,\"tradeAmount\":3309,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000695712845\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1617,\"amount\":999.91,\"tradeAmount\":3308.7,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000695712810\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1617,\"amount\":998.53,\"tradeAmount\":3304.13,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000695712799\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1617,\"amount\":500,\"tradeAmount\":1654.5,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000695712829\",\"productDescription\":\"PRESTAMOS\"},\"expirationDays\":1617,\"amount\":300,\"tradeAmount\":992.7,\"currencyCode\":\"USD\"},{\"product\":{\"productNumber\":\"000000000000\",\"productDescription\":null},\"expirationDays\":0,\"amount\":0,\"tradeAmount\":0,\null}]';
            
    if (res.getStatusCode() == 200) {
    
    List<BP_ExpiredProductsParser> exprod=(List<BP_ExpiredProductsParser>)System.JSON.deserialize(jsonPrueba, List<BP_ExpiredProductsParser>.class);
       System.debug('** iAccount.SourceSystemId__c: '+exprod);
        System.debug(' ** LISTA ||| : ' +  exProd);
       System.debug('PRUEBA 2'+jsonPrueba);
        manageProducts(iAccount.SourceSystemId__c, exprod);
      System.debug('RES: '+res);        
              //statusResponse = '200';
        iAccount.CustomerID__c='200';
            } else if (res.getStatusCode() == 400){
            // Datos inválidos.
            //statusResponse = '400';
        iAccount.CustomerID__c='400';
        System.debug('\n\nResponse HttpResponse: '+res.getBody());
            } else {
                // Servicio no disponible.
                //statusResponse = '503';
        iAccount.CustomerID__c='503';
            }
    //iAccount.BP_UpdateExpiredProducts__c=Datetime.now();
            return iAccount;
        
}
//CONEXION WEBSERVICES
 
    public static BP_ClientPosition__c objexpprdconfid = getExpiredProducts();
    
    //CUSTOM SETTING
    public static BP_ClientPosition__c getExpiredProducts(){
        return BP_ClientPosition__c.getInstance('ExpiredProductsDev');
        }

    public static HttpResponse createHttpRequestEProduct(String clientId){
        
       HttpRequest     req         =   new HttpRequest();
        HttpResponse    response      = new HttpResponse();
        Http            http        =   new Http();

        String parameters   =   '?organisationId='+clientId+'&sortBy=I&collection=I'; 
        String endPoint     =   'https://slfc-des.apidescal.bpp.pe/channel/slfc/v1.0/organisation-consulting/due-debts'+parameters;
       
       //System.debug('parametros y endPoint'+endPoint+parameters);

            req.setHeader('api-key', '73faddd5002cf7147fb65be9b734621e');
            req.setHeader('app-code', 'SLFC');
            req.setMethod('GET');
            req.setEndpoint(endPoint+parameters);
            System.debug('End Point'+endPoint);

        try{
            response=http.send(req);
        }   catch(CalloutException e){

            HttpResponse res=new HttpResponse();
            System.debug('RES: '+res);

            res.setBody('{"errorMessage":"'+e.getMessage()+'"}');
            System.debug('{"errorMessage":"'+e.getMessage()+'"}');
            
            return res;
        }
        return response;
        }
        
//FIN DE CONEXION WEB SERVICES

    //METODO manageProducts //INSERTAR PRODUCTOS
    public static void manageProducts(String clientId, List<BP_ExpiredProductsParser> exprod){ 
           System.debug(' ---- iniciando ---- ' + exprod);
    Account iAccount=[SELECT Id, SourceSystemId__c,BP_UpdateExpiredProducts__c FROM Account WHERE SourceSystemId__c=:clientId LIMIT 1];
       
    /// ASIGNAR VALORES A CAMPOS

    List<BP_MyExpiredProducts__c> lstobjproduct=new List<BP_MyExpiredProducts__c>();

        for (BP_ExpiredProductsParser objParser : exprod){
        BP_MyExpiredProducts__c objProd = new BP_MyExpiredProducts__c();

        objProd.BP_Type__c=objParser.product.productDescription;
        objProd.Name= objParser.product.productNumber;
        objProd.BP_ExpiredDays__c = objParser.expirationDays;
        objProd.BP_NationalCurrencyAmount__c = objParser.tradeAmount;
        objProd.BP_OriginCurrencyAmount__c = objParser.amount;
        objProd.BP_CurrencyIsoCode__c = objParser.currencyCode;
        //iAccount.BP_UpdateExpiredProducts__c = Datetime.now();
        objProd.BP_MyRelatedAccount__c=iAccount.Id;

        lstobjproduct.add(objProd);
    }
    System.debug('AQUI ESTOY: '+lstobjproduct);
    System.debug('FECHA: '+iAccount.BP_UpdateExpiredProducts__c);

   delete[SELECT Id FROM BP_MyExpiredProducts__c where BP_MyRelatedAccount__c=:iAccount.Id];

    insert lstobjproduct;

    }
}
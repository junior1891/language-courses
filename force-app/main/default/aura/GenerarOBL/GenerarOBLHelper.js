({
	handleJsonToExcel : function(component,event,helper) {
        
        var CasoId = component.get('v.recordId');
        console.log('CasoId###' + CasoId);
        
        var action = component.get('c.getData');
        
        action.setParams({
            casoId : component.get('v.recordId')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(' state  ==>> '+state);
            console.log(' res ==>> '+response.getReturnValue());
            var lstCases = response.getReturnValue();
            
            if(state === "SUCCESS"){
                component.set("v.spinner", false);
                component.set("v.jsonData", lstCases);
                
                var createXLSFormatOBj =[],
                    /*HEADERS =['CaseNumber','BP_Banking__c','BP_CodeIBS__c','BP_DocumentNumber',
                              'BP_BusinessName','BP_SBSTyping','BP_RpaProduct','BP_SecondaryProduct',
                              'BP_TypePay','BP_NumberofFee','BP_GracePeriodTerm','CurrencyIsoCode',
                              'BP_RealAmount','BP_OperationTermIn','BP_TEA','BP_ApprovedSpread',
                              'BP_OperationSpread','BP_SubscriptionAccount','BP_IsAutoDebitAccount','BP_FrameworkContract',
                              'BP_NumberLine','BP_RpaProductCode','BP_FundProgram','BP_COperationalManagement',
                              'BP_AutoDebitAccount','BP_ShippingDate','BP_ExporterImporterName','BP_ExporterImporterAddress',
                              'BP_ImpExpCountry','BP_Merchandise','BP_CountryOriginMerchandise','BP_CountryDestinationMerchandise',
                              'BP_SourceDestinationPort','BP_GracePeriodIn','BP_TransferRate','BP_SpecialFunding',
                              'LastModifiedDate','BP_SpecialInstructionsNumber','BP_FrecuencyFee','BP_QuotaFrecuency','BP_QuotaFrequencyUnit'],*/
                              HEADERS =[],          
                              data = JSON.parse(JSON.stringify(component.get('v.jsonData')));
                //console.table(data);

                /* FILE NAME*/
                var fecha = new Date();
                var fechaDoc = fecha.getDate()+"/"+(fecha.getMonth())+"/"+fecha.getFullYear()+"-"+fecha.getHours() + ":" + fecha.getMinutes() + ":" + fecha.getSeconds();
                var name = 'OBL_'+fechaDoc;
                var filename = name+".xls";
                
                /*Sheet Name*/
                var ws_name = "ArchivoOBL";
                
                if(typeof console !=='undefined') console.log(new Date());
                var wb = XLSX.utils.book_new(),
                    ws = XLSX.utils.json_to_sheet(data,{header: HEADERS});
                
                /* Add worksheet to workbook */
                XLSX.utils.book_append_sheet(wb, ws, ws_name);
                
                /* Write workbook and Download */
                if (typeof console !== 'undefined') console.log(new Date());
                XLSX.writeFile(wb, filename);
                if (typeof console !== 'undefined') console.log(new Date());
            }
        });
    $A.enqueueAction(action);
},
})
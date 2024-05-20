import { LightningElement } from 'lwc';

/*Load the script to the component*/

import { loadScript } from 'lightning/platformResourceLoader';

/*Read the excel uploaded data*/

import excelFileReader from '@salesforce/resourceUrl/sheetjs';

let XLS = {};

export default class ExcelFileReader extends LightningElement {

  /*Accepted formats for the excel file*/

  strAcceptedFormats = ['.xls', '.xlsx'];

  strUploadFileName; //Store the name of the selected file.

  objExcelToJSON; //Javascript object to store the content of the file

  connectedCallback() {

    Promise.all([loadScript(this, excelFileReader)])

      .then(() => {

        XLS = XLSX;

      })

      .catch((error) => {

        console.log('An error occurred while processing the file');

      });

  }

  handleUploadFinished(event) {

    const strUploadedFile = event.detail.files;

    if (strUploadedFile.length && strUploadedFile != '') {

      this.strUploadFileName = strUploadedFile[0].name;

      this.handleProcessExcelFile(strUploadedFile[0]);

    }

  }

  handleProcessExcelFile(file) {

    let objFileReader = new FileReader();

    objFileReader.onload = (event) => {

      let objFiledata = event.target.result;

      let objFileWorkbook = XLS.read(objFiledata, {

        type: 'binary'

      });

      this.objExcelToJSON = XLS.utils.sheet_to_row_object_array(

        objFileWorkbook.Sheets['Sheet1']

      );

      //Verify if the file content is not blank

      if (this.objExcelToJSON.length === 0) {

        this.strUploadFileName = '';

        this.dispatchEvent(

          new ShowToastEvent({

            title: 'Error',

            message: 'Kindly upload the file with data',

            variant: 'error'

          })

        );

      }

      if (this.objExcelToJSON.length > 0) {

        //Remove the whitespaces from the javascript object

        Object.keys(this.objExcelToJSON).forEach((key) => {

          const replacedKey = key.trim().toUpperCase().replace(/\s\s+/g, '_');

          if (key !== replacedKey) {

            this.objExcelToJSON[replacedKey] = this.objExcelToJSON[key];

            delete this.objExcelToJSON[key];

          }

        });

        console.log('objExcelToJSON' + objExcelToJSON);

      }

    };

    objFileReader.onerror = function (error) {

      this.dispatchEvent(

        new ShowToastEvent({

          title: 'Error while reading the file',

          message: error.message,

          variant: 'error'

        })

      );

    };

    objFileReader.readAsBinaryString(file);

  }

}
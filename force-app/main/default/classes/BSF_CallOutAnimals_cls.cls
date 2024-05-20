public class BSF_CallOutAnimals_cls {
    public static void callOutAnimals(){
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
    List<Object> animals = (List<Object>) results.get('animals');
    System.debug('Received the following animals:');
    
    //LO QUE RESPONDA ESTA GUARDANDO EN EL OBJETO
    List<Animal__c> lstAnimals=new List<Animal__c>();
    Animal__c objAnimal=new Animal__c();
    
    for (Object animal: animals) {
        objAnimal=new Animal__c();
        objAnimal.Name=String.valueOf(animal); //CONVIERTE OBJETO EN STRING
        lstAnimals.add(objAnimal);
         System.debug(animal);
    }
    insert lstanimals;
}
}
}
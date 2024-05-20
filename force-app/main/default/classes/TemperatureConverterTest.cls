@isTest
public class TemperatureConverterTest {
    static void testwarmpTemp(){
        decimal celsius=TestConvertidorTemperatura.FahrenheitToCelsius(70);
        System.assertEquals(21.11, celsius);
    }
    //@isTest static void testFreezingPoint(){
      //  Decimal celsius=TestConvertidorTemperatura.FahrenheitToCelsius(32);
        //System.assertEquals(0, celsius);
    //}
    @isTest static void testBoilingPoint(){
        decimal celsius=TestConvertidorTemperatura.FahrenheitToCelsius(212);
        System.assertEquals(100, celsius,'BOILING POINT TEMPERATURE IS NOT EXPECTED.');
    }
    @isTest static void testNegativeTemp(){
        decimal celsius=TestConvertidorTemperatura.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33, celsius);
    }
    @isTest
    static void prueba2(){
        decimal rspt=TestConvertidorTemperatura.FahrenheitToCelsius(32);
        System.assert(22.1==rspt,'EL METODO ESTA MAL HECHO');
    }
}
public class TestConvertidorTemperatura {
    public static decimal FahrenheitToCelsius(decimal fh){
        decimal cs=(fh-32)*5/9;
        return cs.setScale(2);
    }
}
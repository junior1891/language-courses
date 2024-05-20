trigger Before_TRGG on Case (before update) {
    for(case casenew:Trigger.new){
        case caseold=(case)Trigger.oldmap.get(casenew.id);
        if(caseold.Status=='Closed' && casenew.Status != 'Closed')
            casenew.Status.adderror('NO PUEDES CAMBIAR EL ESTADO PARA UN CASO CERRADO');
    }
}
//IMPEDIR CAMBIO DE CAMPO ESTADO EN OBJETO CASO.
package fr.bihar.esante

class Carnet {
// TODO : Facteurs aggravants pour aller plus loin

    String fname
    String lname
    Date dob
    String tel
    Integer weight
    Integer height
    String bloodType

    static belongsTo = User

    static hasMany = [consultations: Consultation]

    static constraints = {
        fname nullable: false, blank: false
        lname nullable: false, blank: false
        dob nullable: false
        tel nullable: true
        weight nullable: false,min: 40, max: 150
        height nullable: false, min:140, max:230
        bloodType nullable: false
    }
}

class Job {
  final String intitule;
  final String description;
  final String typeContrat;
  final int remuneration;
  final int assoc;
  final DateTime date;
  final DateTime dateFin;
  final DateTime datePublication;
  final DateTime dateUpdate;
  final String competences;
  final String niveauEtudes;
  final String experience;
  final String secteur;
  final String adresse;
  final String cp;
  final String ville;


  Job(this.intitule, this.description, this.typeContrat, this.remuneration, this.assoc, this.date, this.dateFin, this.datePublication, this.dateUpdate, this.competences, this.niveauEtudes, this.experience, this.secteur, this.adresse, this.cp, this.ville);

  Job.fromJson(Map<String, dynamic> json)
      : intitule = json['intitule'],
        description = json['description'],
        typeContrat = json['typeContrat'],
        remuneration = int.parse(json['remuneration']),
        assoc = int.parse(json['assoc']),
        date = DateTime.parse(json['date']),
        dateFin = DateTime.parse(json['dateFin']),
        datePublication = DateTime.parse(json['datePublication']),
        dateUpdate = DateTime.parse(json['dateUpdate']),
        competences = json['competences'],
        niveauEtudes = json['niveauEtudes'],
        experience = json['experience'],
        secteur = json['secteur'],
        adresse = json['adresse'],
        cp = json['cp'],
        ville = json['ville'];
}
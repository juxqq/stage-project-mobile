class Job {
  final String intitule;
  final String description;
  final String typeContrat;
  final int remuneration;
  final int assoc;
  final String loc;

  Job(this.intitule, this.description, this.typeContrat, this.remuneration, this.assoc, this.loc);

  Job.fromJson(Map<String, dynamic> json)
      : intitule = json['intitule'],
        description = json['description'],
        typeContrat = json['typeContrat'],
        remuneration = int.parse(json['remuneration']),
        assoc = int.parse(json['assoc']),
        loc = json['localisation'];
}
class FeedbackForm {
  String _name;
  String _email;
  String _links;
  String _skills;
  String _ideas;
  String _projects;

  FeedbackForm(this._name, this._email, this._links, this._skills, this._ideas, this._projects);

  // Method to make GET parameters.
  String toParams() =>
      "?name=$_name&email=$_email&links=$_links&skills=$_skills&ideas=$_ideas&projects=$_projects";
}
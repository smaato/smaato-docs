// save the user's consent
private func saveCCPA(usPrivacy string: String?) {
    guard let usString = string else {
        return
    }
    UserDefaults.standard.set(usString, forKey: "IABUSPrivacy_String"
}
// call this function like this:
// saveCCPA(string: "1YNN")
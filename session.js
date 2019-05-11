function getSession() {
    return parseInt(getCookie("studentID"));
}

function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(';');
    for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function setCookie(cname, cvalue) {
    document.cookie = cname + "=" + cvalue + ";";
}

function clearCookie(cname) {
    let cvalue = "";
    document.cookie = cname + "=" + cvalue + ";";
}

function saveSession(studentID) {
    setCookie("studentID", studentID.toString(), 0);
}
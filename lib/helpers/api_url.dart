class ApiUrl {
static const String baseUrl = 'https://responsi1a.dalhaqq.xyz/ikan';

static const String listIkan = baseUrl + '/ikan';
static const String createIkan = baseUrl + '/ikan';

static String updateIkan(int id) {
return baseUrl + '/ikan/' + id.toString();
}

static String showIkan(int id) {
return baseUrl + '/ikan/' + id.toString();
}

static String deleteIkan(int id) {
return baseUrl + '/ikan/' + id.toString();
}
}

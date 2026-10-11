const axios = require("axios").default;
const qs = require("qs");

/// Start supabaseDBAPI Group Code

function createSupabaseDBAPIGroup() {
  return {
    baseUrl: `https://rapbhkvgkjmcmlbamwlz.supabase.co`,
    headers: {
      apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
      Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
      "Content-Type": `application/json`,
    },
  };
}

async function _createEmptyKartingCheckCall(context, ffVariables) {
  var pSealingId = ffVariables["pSealingId"];
  var pCategoryId = ffVariables["pCategoryId"];
  const supabaseDBAPIGroup = createSupabaseDBAPIGroup();

  var url = `${supabaseDBAPIGroup.baseUrl}/rest/v1/rpc/create_empty_ks_karting_checks_data`;
  var headers = {
    apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "p_sealing_id": ${pSealingId == null ? "null" : `"${escapeStringForJson(pSealingId)}"`},
  "p_category": ${pCategoryId == null ? "null" : `"${escapeStringForJson(pCategoryId)}"`}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createEmptyAndCopyKartingChecksCall(context, ffVariables) {
  var newSealingId = ffVariables["newSealingId"];
  var sourceSealingId = ffVariables["sourceSealingId"];
  var category = ffVariables["category"];
  const supabaseDBAPIGroup = createSupabaseDBAPIGroup();

  var url = `${supabaseDBAPIGroup.baseUrl}/rest/v1/rpc/create_karting_checks_data`;
  var headers = {
    apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "p_new_sealing_id": ${newSealingId == null ? "null" : `"${escapeStringForJson(newSealingId)}"`},
  "p_source_sealing_id": ${sourceSealingId == null ? "null" : `"${escapeStringForJson(sourceSealingId)}"`},
  "p_category": ${category == null ? "null" : `"${escapeStringForJson(category)}"`}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createUniqueNumberCall(context, ffVariables) {
  var engineNumber = ffVariables["engineNumber"];
  var roundNumber = ffVariables["roundNumber"];
  var year = ffVariables["year"];
  var sealType = ffVariables["sealType"];
  var eventNameCode = ffVariables["eventNameCode"];
  const supabaseDBAPIGroup = createSupabaseDBAPIGroup();

  var url = `${supabaseDBAPIGroup.baseUrl}/rest/v1/rpc/generate_unique_number`;
  var headers = {
    apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "p_engine_number": ${engineNumber == null ? "null" : `"${escapeStringForJson(engineNumber)}"`},
  "p_event_name": ${eventNameCode == null ? "null" : `"${escapeStringForJson(eventNameCode)}"`},
  "p_round": ${roundNumber == null ? "null" : `"${escapeStringForJson(roundNumber)}"`},
  "p_year": ${year == null ? "null" : `"${escapeStringForJson(year)}"`},
  "p_seal_type": ${sealType == null ? "null" : `"${escapeStringForJson(sealType)}"`}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _noOfSealPerTeamCall(context, ffVariables) {
  var round = ffVariables["round"];
  var year = ffVariables["year"];
  var eventName = ffVariables["eventName"];
  var inspectionCompleted = ffVariables["inspectionCompleted"];
  const supabaseDBAPIGroup = createSupabaseDBAPIGroup();

  var url = `${supabaseDBAPIGroup.baseUrl}/rest/v1/rpc/get_sealing_entries_per_team`;
  var headers = {
    apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "p_round": ${round == null ? "null" : `"${escapeStringForJson(round)}"`},
  "p_year": ${year == null ? "null" : `"${escapeStringForJson(year)}"`},
  "p_eventname": ${eventName == null ? "null" : `"${escapeStringForJson(eventName)}"`},
  "p_inspection_completed": ${inspectionCompleted == null ? "null" : `"${inspectionCompleted}"`}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _isUserAlreadyRegisteredCall(context, ffVariables) {
  var eventId = ffVariables["eventId"];
  var driverId = ffVariables["driverId"];
  var category = ffVariables["category"];
  const supabaseDBAPIGroup = createSupabaseDBAPIGroup();

  var url = `${supabaseDBAPIGroup.baseUrl}/rest/v1/rpc/check_event_registration`;
  var headers = {
    apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "p_event_id": ${eventId == null ? "null" : `"${escapeStringForJson(eventId)}"`},
  "p_driver_id": ${driverId == null ? "null" : `"${escapeStringForJson(driverId)}"`},
  "p_category": ${category == null ? "null" : `"${escapeStringForJson(category)}"`}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getCompEntryNumberCall(context, ffVariables) {
  var vEventId = ffVariables["vEventId"];
  var vDriverId = ffVariables["vDriverId"];
  var vCategory = ffVariables["vCategory"];
  const supabaseDBAPIGroup = createSupabaseDBAPIGroup();

  var url = `${supabaseDBAPIGroup.baseUrl}/rest/v1/rpc/get_available_numbers`;
  var headers = {
    apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "p_event_id": ${vEventId == null ? "null" : `"${escapeStringForJson(vEventId)}"`},
  "p_current_driver_id": ${vDriverId == null ? "null" : `"${escapeStringForJson(vDriverId)}"`},
  "p_category_name": ${vCategory == null ? "null" : `"${escapeStringForJson(vCategory)}"`}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getcategorynumbersCall(context, ffVariables) {
  var vCategory = ffVariables["vCategory"];
  var vEventID = ffVariables["vEventID"];
  const supabaseDBAPIGroup = createSupabaseDBAPIGroup();

  var url = `${supabaseDBAPIGroup.baseUrl}/rest/v1/rpc/get_category_numbers`;
  var headers = {
    apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "p_event_id": ${vEventID == null ? "null" : `"${escapeStringForJson(vEventID)}"`},
  "p_category_name": ${vCategory == null ? "null" : `"${escapeStringForJson(vCategory)}"`}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getUniqueEntryNumberCall(context, ffVariables) {
  var vEventId = ffVariables["vEventId"];
  var vCategory = ffVariables["vCategory"];
  var vDriverId = ffVariables["vDriverId"];
  const supabaseDBAPIGroup = createSupabaseDBAPIGroup();

  var url = `${supabaseDBAPIGroup.baseUrl}/rest/v1/rpc/get_available_entry_numbers_string`;
  var headers = {
    apikey: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "p_event_id": ${vEventId == null ? "null" : `"${escapeStringForJson(vEventId)}"`},
  "p_driver_id": ${vDriverId == null ? "null" : `"${escapeStringForJson(vDriverId)}"`},
  "p_category_name": ${vCategory == null ? "null" : `"${escapeStringForJson(vCategory)}"`}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// End supabaseDBAPI Group Code

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    CreateEmptyKartingCheckCall: _createEmptyKartingCheckCall,
    CreateEmptyAndCopyKartingChecksCall: _createEmptyAndCopyKartingChecksCall,
    CreateUniqueNumberCall: _createUniqueNumberCall,
    NoOfSealPerTeamCall: _noOfSealPerTeamCall,
    IsUserAlreadyRegisteredCall: _isUserAlreadyRegisteredCall,
    GetCompEntryNumberCall: _getCompEntryNumberCall,
    GetcategorynumbersCall: _getcategorynumbersCall,
    GetUniqueEntryNumberCall: _getUniqueEntryNumberCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return JSON.stringify(val).slice(1, -1);
}

module.exports = { makeApiCall };

[Version = "1.0.0"]
section PowerInformixRetro;

[DataSource.Kind="PowerInformixRetro", Publish="PowerInformixRetro.Publish"]
shared PowerInformixRetro.Contents = (dsn as text, host as text, server as text, service as text, database as text, protocol as text, optional query as nullable text) =>
    let
        Credential = Extension.CurrentCredential(),
        uid = Credential[Username],
        pwd = Credential[Password],
        connectionString = "Driver={IBM INFORMIX ODBC DRIVER (64-bit)};DSN=" & dsn & ";HOST=" & host & ";SERVER=" & server & ";SERVICE=" & service & ";DATABASE=" & database & ";PROTOCOL=" & protocol & ";UID=" & uid & ";PWD=" & pwd & ";",
        result = if query <> null and Text.Trim(query) <> "" then Odbc.Query(connectionString, query) else connectionString
    in
        result;



PowerInformixRetro = [
    TestConnection = (dataSourcePath) =>
        let
            json = Json.Document(dataSourcePath),
            dsn = json[dsn],
            host = json[host],
            server = json[server],
            service = json[service],
            database = json[database],
            protocol = json[protocol]
        in
            { "PowerInformixRetro.Contents", dsn, host, server, service, database, protocol, "SELECT 1" },
    Authentication = [
        UsernamePassword = []
    ],
    Label = Extension.LoadString("DataSourceLabel")
];



PowerInformixRetro.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = PowerInformixRetro.Icons,
    SourceTypeImage = PowerInformixRetro.Icons,
    SupportsDirectQuery = false
];

PowerInformixRetro.Icons = [
    Icon16 = { Extension.Contents("PowerInformixRetro16.png"), Extension.Contents("PowerInformixRetro20.png"), Extension.Contents("PowerInformixRetro24.png"), Extension.Contents("PowerInformixRetro32.png") },
    Icon32 = { Extension.Contents("PowerInformixRetro32.png"), Extension.Contents("PowerInformixRetro40.png"), Extension.Contents("PowerInformixRetro48.png"), Extension.Contents("PowerInformixRetro64.png") }
];

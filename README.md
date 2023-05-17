# PowerInformixRetro

PowerInformixRetro est un `connecteur personnalisé pour Power BI`, écrit en Power Query M et développé avec `Visual Studio Code` + `Power Query SDK`.

PowerInformixRetro permet à Power BI de se connecter aux bases de données `IBM Informix antérieures à la version 9` en utilisant le pilote `ODBC Informix`, en surmontant ainsi les limitations des connecteurs par défaut de Power BI.
PowerInformixRetro définit la façon dont Power BI doit se connecter à la base de données, comment il doit authentifier l'utilisateur et comment il doit tester la connexion.

Le code se veut simple et modulable. Il est conçu pour être facilement adaptable à d'autres pilotes de bases de données.

- La fonction `PowerInformixRetro.Contents` est utilisée pour établir une connexion à la base de données Informix.
- La fonction `TestConnection` est utilisée pour tester la connexion à la base de données.
- La section `Authentication` définit les méthodes d'authentification prises en charge par le connecteur.
- La section `PowerInformixRetro.Publish` définit la méthode de publication du connecteur compatible avec l'interface utilisateur de Power BI.
- La section `PowerInformixRetro.Icons` définit les icônes à utiliser pour le connecteur dans l'interface utilisateur de Power BI.

Pour plus d'informations sur Visual Studio Code et Power Query :
- Téléchargement de Visual Studio Code : [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
- Documentation Power Query (en français) : [https://learn.microsoft.com/fr-fr/power-query](https://learn.microsoft.com/fr-fr/power-query)

// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
namespace EdFi.AdminConsoleHealthCheckService.Configuration;
public class AdminApiSettings
{
    public string HealthCheckUrl { get; set; }
    public string TokenUrl { get; set; }
    public string ClientId { get; set; }
    public string ClientSecret { get; set; }
    public string GrantType { get; set; }
    public string Scope { get; set; }
}

public class SwaggerSettings
{
    public bool EnableSwagger { get; set; }
}


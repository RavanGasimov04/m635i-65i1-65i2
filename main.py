"""
DevOps Security Toolkit — Core Module
Simulates infrastructure health checks and security validations.
"""

import datetime


def check_service_health(service_name: str, port: int) -> dict:
    """Simulate a service health check."""
    return {
        "service": service_name,
        "port": port,
        "status": "healthy",
        "timestamp": datetime.datetime.utcnow().isoformat(),
        "response_ms": 42,
    }


def validate_config(config: dict) -> list:
    """
    Validate a configuration dictionary for common security issues.
    Returns a list of warnings.
    """
    warnings = []

    if config.get("debug", False):
        warnings.append("WARNING: debug mode is enabled in production config")

    if config.get("allow_all_hosts", False):
        warnings.append("WARNING: allow_all_hosts is True — restrict to known hosts")

    if not config.get("tls_enabled", False):
        warnings.append("WARNING: TLS is not enabled — enable for production")

    return warnings


def generate_report(app_name: str, version: str) -> str:
    """Generate a simple deployment readiness report."""
    lines = [
        f"App     : {app_name}",
        f"Version : {version}",
        f"Date    : {datetime.datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')}",
        "Status  : Ready for deployment",
    ]
    return "\n".join(lines)


if __name__ == "__main__":
    health = check_service_health("auth-service", 8080)
    print("Health Check Result:", health)

    config = {"debug": False, "tls_enabled": True, "allow_all_hosts": False}
    issues = validate_config(config)
    if issues:
        for w in issues:
            print(w)
    else:
        print("✅ Config validation passed — no issues found")

    print(generate_report("devops-security-toolkit", "1.0.0"))

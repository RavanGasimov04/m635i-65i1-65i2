"""
Unit tests for the DevOps Security Toolkit core module.
Run with: python -m pytest tests/
"""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src'))

from main import check_service_health, validate_config, generate_report


def test_health_check_returns_healthy():
    result = check_service_health("api-gateway", 443)
    assert result["status"] == "healthy"
    assert result["service"] == "api-gateway"
    assert result["port"] == 443
    assert "timestamp" in result


def test_validate_config_no_warnings_on_good_config():
    config = {
        "debug": False,
        "tls_enabled": True,
        "allow_all_hosts": False
    }
    warnings = validate_config(config)
    assert len(warnings) == 0


def test_validate_config_warns_on_debug_mode():
    config = {"debug": True, "tls_enabled": True}
    warnings = validate_config(config)
    assert any("debug" in w.lower() for w in warnings)


def test_validate_config_warns_on_no_tls():
    config = {"debug": False, "tls_enabled": False}
    warnings = validate_config(config)
    assert any("tls" in w.lower() for w in warnings)


def test_generate_report_contains_version():
    report = generate_report("my-app", "2.5.1")
    assert "2.5.1" in report
    assert "my-app" in report

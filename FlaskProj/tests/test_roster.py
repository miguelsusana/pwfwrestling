import pytest
from app import app

@pytest.fixture
def client():
    """Sets up a test client for the Flask app."""
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_roster_endpoint(client):
    """Tests that the endpoint /api/roster returns a successful response."""
    response = client.get("/api/roster-new")
    assert response.status_code == 200

def test_roster_returns_list(client):
    """Tests that the endpoint /api/roster returns a list of wrestlers."""
    response = client.get("/api/roster-new")
    data = response.get_json()
    assert isinstance(data, list)

def test_roster_is_not_empty(client):
    """Tests that the endpoint /api/roster returns a non-empty list."""
    response = client.get("/api/roster-new")
    data = response.get_json()
    assert len(data) > 0

def test_wrestler_in_roster(client):
    """Tests that a specific wrestler is present in the roster list."""
    names = []
    response = client.get("/api/roster-new")
    data = response.get_json()
    for wrestler in data:
        names.append(wrestler['name'])
    assert "Mike Silva" in names

def test_wrestler_items_have_expected_keys(client):
    """Tests that each wrestler entry contains the expected keys."""
    response = client.get("/api/roster-new")
    data = response.get_json()
    assert data
    for wrestler in data:
        assert "id" in wrestler
        assert "name" in wrestler
        assert "brand" in wrestler


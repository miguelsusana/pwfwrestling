import pytest
from app import app

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_create_event_feature(client):
    event = {
        "name": "TestEventSlam",
        "month": "June",
        "year": 1,
        "season": 10,
        "instance_number": 1
    }

    response = client.post("/api/create_event", json=event)
    assert response.status_code == 201
    data = response.get_json()
    assert data["success"] is True
    #event_id = data["event_id"]
    #cleanup_response = client.delete(f"/api/events/{event_id}")
    #assert cleanup_response.status_code == 200
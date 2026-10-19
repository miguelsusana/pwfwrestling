import os

os.environ["PWFWRESTLING_CONFIG"] = os.path.join(
    os.path.dirname(os.path.dirname(__file__)),
    "config.test.ini",
)

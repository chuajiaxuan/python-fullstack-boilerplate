import httpx
import streamlit as st
from typing import Dict, Any


class APIClient:
    def __init__(self, base_url: str = "http://localhost:8000"):
        self.base_url = base_url
        self.api_v1_str = "/api/v1"
        
    def _make_request(self, method: str, endpoint: str, **kwargs) -> Dict[str, Any]:
        url = f"{self.base_url}{self.api_v1_str}{endpoint}"
        
        with httpx.Client() as client:
            response = client.request(method, url, **kwargs)
            response.raise_for_status()
            return response.json()
    
    def get_hello(self) -> Dict[str, Any]:
        return self._make_request("GET", "/")
    
    def get_health(self) -> Dict[str, Any]:
        return self._make_request("GET", "/health")
    
    def greet_person(self, name: str) -> Dict[str, Any]:
        return self._make_request("GET", f"/greet/{name}")
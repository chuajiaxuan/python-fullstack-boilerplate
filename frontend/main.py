import streamlit as st
from frontend.utils.api_client import APIClient


def main():
    st.set_page_config(
        page_title="Hello World App",
        page_icon="👋",
        layout="centered"
    )
    
    st.title("👋 Hello World Fullstack App")
    st.markdown("Welcome to your first FastAPI + Streamlit application!")
    
    api_client = APIClient()
    
    st.markdown("### 🚀 Try the API")
    
    if st.button("Say Hello World!", type="primary"):
        try:
            response = api_client.get_hello()
            st.success(f"🎉 {response['message']}")
        except Exception as e:
            st.error(f"❌ Couldn't connect to backend: {e}")
            st.info("💡 Make sure the backend is running: `make backend`")
    
    st.markdown("---")
    
    st.markdown("### 👤 Personal Greeting")
    name = st.text_input("Enter your name:", placeholder="Your name here...")
    
    if st.button("Get Personal Greeting") and name:
        try:
            response = api_client.greet_person(name)
            st.success(f"🎈 {response['message']}")
        except Exception as e:
            st.error(f"❌ Error: {e}")
    
    st.markdown("---")
    
    with st.expander("🔧 Backend Status"):
        if st.button("Check Backend Health"):
            try:
                health = api_client.get_health()
                st.json(health)
            except Exception as e:
                st.error(f"Backend not running: {e}")


def run():
    main()


if __name__ == "__main__":
    run()
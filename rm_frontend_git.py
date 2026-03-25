import shutil
import os

git_dir = os.path.join(r"c:\Hotel M\frontend", ".git")
try:
    if os.path.exists(git_dir):
        def remove_readonly(func, path, excinfo):
            os.chmod(path, 0o777)
            func(path)
        shutil.rmtree(git_dir, onerror=remove_readonly)
        print("✅ Successfully removed nested .git directory in frontend")
    else:
        print("✅ frontend/.git directory does not exist")
except Exception as e:
    print(f"❌ Error: {e}")

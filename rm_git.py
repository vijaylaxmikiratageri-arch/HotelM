import shutil
import os

git_dir = os.path.join(r"c:\Hotel M", ".git")
try:
    if os.path.exists(git_dir):
        # Handle read-only files by providing an onerror handler
        def remove_readonly(func, path, excinfo):
            os.chmod(path, 0o777)
            func(path)
        shutil.rmtree(git_dir, onerror=remove_readonly)
        print("✅ Successfully removed .git directory")
    else:
        print("✅ .git directory does not exist")
except Exception as e:
    print(f"❌ Error: {e}")

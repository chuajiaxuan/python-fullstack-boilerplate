# Git Branching Workflow Guide 🌿

*A beginner-friendly guide to working with git branches in this project*

## 🎯 What is Branching?

Think of git branches like different versions of your project that you can work on separately. Imagine you're writing a book:
- The **main branch** is your published book
- **Feature branches** are like draft chapters you're working on
- You can write multiple chapters at once without messing up your published book!

## 🌳 Our Branching Strategy

We use a simple but effective branching strategy:

```
main (production-ready code)
├── develop (integration branch)
├── feature/user-authentication
├── feature/dashboard-ui
├── bugfix/login-error
└── hotfix/critical-security-patch
```

### Branch Types

| Branch Type | Purpose | Example | Merges to |
|-------------|---------|---------|-----------|
| `main` | Production-ready code | `main` | - |
| `develop` | Integration of features | `develop` | `main` |
| `feature/` | New features | `feature/user-login` | `develop` |
| `bugfix/` | Bug fixes | `bugfix/fix-login-error` | `develop` |
| `hotfix/` | Critical fixes | `hotfix/security-patch` | `main` & `develop` |

## 🚀 Step-by-Step Workflow

### Starting a New Feature

1. **Make sure you're on the develop branch**
   ```bash
   git checkout develop
   git pull origin develop
   ```

2. **Create a new feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
   
   **Naming Examples:**
   - `feature/user-registration`
   - `feature/payment-integration`
   - `feature/dashboard-charts`

3. **Work on your feature**
   - Make your changes
   - Test your code
   - Commit regularly with clear messages

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add user registration form with validation"
   ```

### Finishing a Feature

1. **Make sure your code is ready**
   ```bash
   # Run tests
   pytest
   
   # Check code quality
   ruff check .
   ruff format .
   mypy .
   ```

2. **Push your branch**
   ```bash
   git push origin feature/your-feature-name
   ```

3. **Create a Pull Request (PR)**
   - Go to GitHub
   - Click "New Pull Request"
   - Select: `feature/your-feature-name` → `develop`
   - Write a clear description of what you built
   - Ask for review

4. **After PR is approved and merged**
   ```bash
   git checkout develop
   git pull origin develop
   git branch -d feature/your-feature-name  # Clean up
   ```

## 🐛 Fixing Bugs

Same process as features, but use `bugfix/` prefix:

```bash
git checkout develop
git pull origin develop
git checkout -b bugfix/fix-login-error
# ... make your fixes ...
git push origin bugfix/fix-login-error
# Create PR: bugfix/fix-login-error → develop
```

## 🚨 Emergency Fixes (Hotfixes)

For critical bugs in production:

```bash
git checkout main
git pull origin main
git checkout -b hotfix/critical-issue-description
# ... make your urgent fix ...
git push origin hotfix/critical-issue-description
```

Create **TWO** pull requests:
1. `hotfix/critical-issue-description` → `main`
2. `hotfix/critical-issue-description` → `develop`

## 📝 Commit Message Guidelines

Write commit messages that explain **why** you made the change:

### Good Examples ✅
```
Add user authentication to secure dashboard access
Fix database connection timeout in production environment
Update API documentation for new endpoints
```

### Bad Examples ❌
```
Updated code
Fixed bug
Changes
```

### Commit Message Format
```
<type>: <description>

[optional body explaining why this change was needed]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code formatting (no functional changes)
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance tasks

## 🔄 Keeping Your Branch Updated

If you're working on a long feature, keep your branch updated:

```bash
git checkout develop
git pull origin develop
git checkout feature/your-feature-name
git merge develop
```

Or use rebase for a cleaner history:
```bash
git checkout feature/your-feature-name
git rebase develop
```

## ❗ Common Mistakes to Avoid

1. **Don't work directly on main or develop**
   - Always create feature branches!

2. **Don't push broken code**
   - Test before pushing
   - Run `ruff check .` and `pytest`

3. **Don't create giant commits**
   - Commit small, logical changes
   - One feature = multiple small commits

4. **Don't ignore merge conflicts**
   - Resolve them carefully
   - Test after resolving conflicts

## 🆘 I Messed Up! Help!

### I committed to the wrong branch
```bash
# Move your commit to the right branch
git log  # Find your commit hash
git reset --hard HEAD~1  # Remove commit from current branch
git checkout correct-branch
git cherry-pick <commit-hash>  # Add commit to correct branch
```

### I need to undo my last commit
```bash
git reset --soft HEAD~1  # Keeps your changes, removes commit
git reset --hard HEAD~1  # DANGER: Removes changes AND commit
```

### I have merge conflicts
1. Git will mark conflicted files
2. Open each file and look for `<<<<<<< HEAD`
3. Choose which version to keep
4. Remove the conflict markers
5. `git add .` and `git commit`

## 📚 Quick Reference

### Essential Commands
```bash
# See all branches
git branch -a

# Switch branches
git checkout branch-name

# Create and switch to new branch
git checkout -b new-branch-name

# See what changed
git status
git diff

# Stage and commit
git add .
git commit -m "Your message"

# Push changes
git push origin branch-name

# Update from remote
git pull origin branch-name
```

## 🎓 Learning Resources

- [Git Basics Tutorial](https://git-scm.com/docs/gittutorial)
- [Interactive Git Tutorial](https://learngitbranching.js.org/)
- [GitHub Flow Guide](https://guides.github.com/introduction/flow/)

---

**Remember:** It's okay to make mistakes! Git is designed to be safe, and most "mistakes" can be undone. When in doubt, ask for help! 🤝
# GitHub Pages Setup Instructions

This document explains how to enable GitHub Pages for this presentation.

## Quick Setup

1. Go to the repository on GitHub: https://github.com/mattscilipoti/developing_with_ruby_in_docker

2. Click on **Settings** (top menu)

3. In the left sidebar, click on **Pages**

4. Under "Build and deployment":
   - **Source:** Select "Deploy from a branch"
   - **Branch:** Select `main` (or your default branch)
   - **Folder:** Select `/docs`
   - Click **Save**

5. Wait 1-2 minutes for deployment

6. The presentation will be available at:
   ```
   https://mattscilipoti.github.io/developing_with_ruby_in_docker/
   ```

## Verification

Once enabled, you should see:
- A green checkmark indicating successful deployment
- A link to visit your site at the top of the Pages settings

## Troubleshooting

### Page shows 404
- Wait a few minutes after enabling (first deployment can take time)
- Check that the branch and folder are correctly set
- Verify `docs/index.html` exists in the repository

### Changes not appearing
- GitHub Pages can take 1-5 minutes to update
- Check the Actions tab for deployment status
- Try a hard refresh in your browser (Ctrl+Shift+R or Cmd+Shift+R)

### Custom domain (Optional)
If you want to use a custom domain:
1. In Pages settings, enter your custom domain
2. Add a CNAME record in your DNS settings pointing to `mattscilipoti.github.io`
3. Wait for DNS propagation (can take up to 24 hours)

## Updating the Presentation

After making changes to `docs/index.html`:

1. Commit and push changes to the main branch
2. GitHub automatically rebuilds and deploys
3. Wait 1-2 minutes for changes to appear
4. No manual steps needed!

## Local Testing

To test the presentation locally before pushing:

```bash
cd docs
python3 -m http.server 8080
# Open http://localhost:8080 in your browser
```

## Jekyll Configuration

The `docs/_config.yml` file configures the minimal Jekyll theme for any markdown files in the docs directory. The main presentation (`index.html`) is served directly and doesn't use Jekyll.

## Repository Settings Access

**Note:** You need admin or maintainer access to the repository to enable GitHub Pages.

If you don't have access:
1. Fork the repository
2. Enable Pages in your fork
3. The presentation will be available at `https://YOUR_USERNAME.github.io/developing_with_ruby_in_docker/`

## Alternative Deployment Methods

### Using GitHub Actions (Advanced)
For more control, you can use GitHub Actions workflow:

```yaml
# .github/workflows/pages.yml
name: Deploy Pages

on:
  push:
    branches: ["main"]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v4
      - uses: actions/upload-pages-artifact@v3
        with:
          path: 'docs'
      - id: deployment
        uses: actions/deploy-pages@v4
```

This provides more flexibility and faster deployments.

## Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Pages Troubleshooting](https://docs.github.com/en/pages/getting-started-with-github-pages/troubleshooting-404-errors-for-github-pages-sites)

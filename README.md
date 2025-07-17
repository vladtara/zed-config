### Zed IDE Configuration

A comprehensive configuration setup for the Zed IDE, including custom keybindings, settings, and workspace preferences optimized for development workflows.

## Features

- **Custom Keybindings**: Streamlined shortcuts for git panel, terminal, and assistant features
- **Optimized Settings**: Carefully tuned editor settings for productivity
- **Theme Configuration**: System-adaptive theme with One Dark Pro (light) and Ayu Dark (dark)
- **Terminal Integration**: Enhanced terminal experience with split pane support
- **AI Assistant**: Configured with Copilot Chat integration

## Installation

### Prerequisites

- [Zed IDE](https://zed.dev) installed on your system
- Git installed and configured

### Setup Instructions

1. **Clone the repository**:

   ```bash
   git clone https://github.com/vladtara/zed-config.git
   ```

2. **Navigate to the Zed configuration directory**:

   The Zed configuration is located at `~/.config/zed/`

3. **Backup existing configuration** (if any):

   ```bash
   mv ~/.config/zed ~/.config/zed.backup
   ```

4. **Create symbolic link or copy files**:

   **Option A: Symbolic Link (Recommended)**

   ```bash
   ln -s /path/to/zed-config ~/.config/zed
   ```

   **Option B: Copy Files**

   ```bash
   cp -r /path/to/zed-config ~/.config/zed
   ```

5. **Restart Zed IDE** to apply the new configuration.

### Git Repository

1. **Fork this repository** or create your own based on this template
2. **Clone your fork** on each machine following the installation steps above
3. **Keep configurations in sync** by pushing/pulling changes:
   ```bash
   cd ~/.config/zed  # or your Zed config directory
   git add .
   git commit -m "Update configuration"
   git push origin main
   ```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions:

1. Check the [Zed documentation](https://zed.dev/docs)
2. Search existing issues in this repository
3. Create a new issue with detailed information about your problem

---

**Note**: Always backup your existing configuration before applying these settings. This configuration is optimized for development workflows but may need adjustment based on your specific needs.

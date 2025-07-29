#!/bin/bash
# setup-ollama-for-neovim.sh

echo "Setting up Ollama models for NeoVim development..."

# Check if Ollama is installed
if ! command -v ollama &>/dev/null; then
	echo "❌ Ollama is not installed. Please install it first:"
	echo "   yay -S ollama"
	exit 1
fi

# Ensure Ollama is running
if ! pgrep -x "ollama" >/dev/null; then
	echo "Starting Ollama service..."
	sudo systemctl start ollama
	sleep 5
fi

# Check if Ollama is responsive
if ! ollama list &>/dev/null; then
	echo "❌ Ollama service is not responding. Please check the installation."
	echo "Try: sudo systemctl status ollama"
	exit 1
fi

echo "✅ Ollama is running"

# Download essential models for development
echo "Downloading development-focused models..."

# Fast code completion model
echo "📥 Downloading CodeLlama 7B (fast completions)..."
if ollama pull codellama:7b; then
	echo "✅ CodeLlama 7B downloaded successfully"
else
	echo "❌ Failed to download CodeLlama 7B"
fi

# Better reasoning model - Try Llama 3.1 8B first, then fallbacks
echo "📥 Downloading Llama models (general purpose)..."
if ollama pull llama3.1:8b; then
	echo "✅ Llama 3.1 8B downloaded successfully"
elif ollama pull llama3:8b; then
	echo "✅ Llama 3 8B downloaded successfully"
elif ollama pull llama3.2:3b; then
	echo "✅ Llama 3.2 3B downloaded successfully"
else
	echo "❌ Failed to download any Llama models"
	echo "You may need to check available models with: ollama search llama"
fi

# Alternative: Try Qwen2.5 Coder which is excellent and usually available
echo "📥 Downloading Qwen2.5 Coder 7B (excellent for coding)..."
if ollama pull qwen2.5-coder:7b; then
	echo "✅ Qwen2.5 Coder 7B downloaded successfully"
else
	echo "❌ Failed to download Qwen2.5 Coder"
fi

# Specialized code model
echo "📥 Downloading DeepSeek Coder 6.7B (code-focused)..."
if ollama pull deepseek-coder:6.7b; then
	echo "✅ DeepSeek Coder 6.7B downloaded successfully"
else
	echo "❌ Failed to download DeepSeek Coder"
	echo "Trying CodeGemma instead..."
	if ollama pull codegemma:7b; then
		echo "✅ CodeGemma 7B downloaded successfully"
	else
		echo "❌ Failed to download CodeGemma"
	fi
fi

# Optional: Larger model for complex tasks (only if you have enough RAM)
read -p "Download CodeLlama 13B? (requires ~8GB RAM) [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "📥 Downloading CodeLlama 13B..."
	ollama pull codellama:13b
fi

# Create custom Modelfile for optimized code completion
echo "Creating optimized code completion model..."
cat >/tmp/fastcode.Modelfile <<'EOF'
FROM codellama:7b

PARAMETER temperature 0.1
PARAMETER top_p 0.9
PARAMETER num_ctx 4096
PARAMETER stop "<|endoftext|>"
PARAMETER stop "```"

SYSTEM """You are a helpful coding assistant. Provide concise, accurate code completions and suggestions. Focus on correctness and efficiency."""
EOF

ollama create fastcode -f /tmp/fastcode.Modelfile

# Test the setup
echo "🧪 Testing available models..."

echo "📋 Currently installed models:"
ollama list

# Test with a simple prompt
if ollama list | grep -q "codellama:7b"; then
	echo "✅ Testing CodeLlama 7B..."
	echo "def fibonacci(n):" | timeout 30 ollama run codellama:7b
else
	echo "⚠️  CodeLlama 7B not available"
fi

if ollama list | grep -q "llama3.2"; then
	local_model=$(ollama list | grep "llama3.2" | head -1 | awk '{print $1}')
	echo "✅ Testing $local_model..."
	echo "Explain what a binary search algorithm does:" | timeout 30 ollama run "$local_model"
else
	echo "⚠️  No Llama 3.2 models available"
fi

echo "✅ Setup complete!"
echo ""
echo "Available models:"
ollama list
echo ""
echo "🚀 Your NeoVim is now ready with AI assistance!"
echo ""
echo "Key features available:"
echo "  • Code completion with <Leader>ai"
echo "  • Code review with <Leader>cr (visual mode)"
echo "  • Test generation with <Leader>ct (visual mode)"
echo "  • Code explanation with <Leader>ce (visual mode)"
echo "  • Bug fixing with <Leader>cf (visual mode)"
echo "  • Chat interface with <Leader>aa"
echo ""
echo "Usage tips:"
echo "  1. Select code in visual mode, then use the shortcuts above"
echo "  2. Use <Leader>am to switch between models"
echo "  3. Use <Leader>ad to fix LSP diagnostics with AI"
echo "  4. Chat is persistent - you can have ongoing conversations"
echo ""
echo "Happy coding! 🎉"

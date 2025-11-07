<div align="center">

<!-- Header -->
<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,20,12,24&height=200&section=header&text=Contributing&fontSize=70&animation=fadeIn&fontAlignY=35&desc=Help%20Make%20This%20Project%20Better!&descAlignY=55&descAlign=50" width="100%"/>

<br/>

<img src="https://img.shields.io/badge/Contributions-Welcome-brightgreen?style=for-the-badge" alt="Contributions Welcome"/>
<img src="https://img.shields.io/badge/PRs-Accepted-blue?style=for-the-badge" alt="PRs Accepted"/>
<img src="https://img.shields.io/badge/Issues-Tracked-orange?style=for-the-badge" alt="Issues"/>

<br/><br/>

**Thank you for considering contributing to this project! 💖**

We love your input! We want to make contributing to this project as easy and transparent as possible.

<br/>

</div>

---

## 🌟 **Table of Contents**

- [Code of Conduct](#-code-of-conduct)
- [How Can I Contribute?](#-how-can-i-contribute)
- [Development Setup](#-development-setup)
- [Coding Guidelines](#-coding-guidelines)
- [Commit Message Guidelines](#-commit-message-guidelines)
- [Pull Request Process](#-pull-request-process)
- [Testing Guidelines](#-testing-guidelines)
- [Documentation](#-documentation)
- [Community](#-community)

---

## 📜 **Code of Conduct**

<div align="center">

### 🤝 **Our Pledge**

We are committed to providing a welcoming and inspiring community for everyone.

</div>

### **Our Standards**

✅ **DO**
- 🤗 Be respectful and welcoming
- 💬 Use inclusive language
- 🎯 Focus on what's best for the community
- 🙏 Accept constructive criticism gracefully
- 🤝 Show empathy towards others

❌ **DON'T**
- 🚫 Use inappropriate language or imagery
- 🚫 Make personal attacks
- 🚫 Publish others' private information
- 🚫 Engage in trolling or harassment
- 🚫 Act unprofessionally

---

## 🎯 **How Can I Contribute?**

### 💡 **Types of Contributions**

<table>
<tr>
<td align="center" width="25%">

### 🐛 **Bug Reports**

Found a bug? Help us squash it!

[Report Bug →](https://github.com/yourusername/STM32_MikroC/issues/new?template=bug_report.md)

</td>
<td align="center" width="25%">

### ✨ **Feature Requests**

Have an idea? We'd love to hear it!

[Request Feature →](https://github.com/yourusername/STM32_MikroC/issues/new?template=feature_request.md)

</td>
<td align="center" width="25%">

### 📝 **Documentation**

Improve our docs and help others!

[Improve Docs →](#documentation)

</td>
<td align="center" width="25%">

### 💻 **Code Contributions**

Add features or fix bugs!

[Start Coding →](#development-setup)

</td>
</tr>
</table>

---

### 🐛 **Reporting Bugs**

Before creating a bug report, please check the [issue tracker](https://github.com/yourusername/STM32_MikroC/issues) to avoid duplicates.

#### **Bug Report Checklist**

- [ ] 📋 Use the bug report template
- [ ] 🔍 Search existing issues first
- [ ] 📝 Provide detailed description
- [ ] 💻 Include system information
- [ ] 📊 Add steps to reproduce
- [ ] 📸 Attach screenshots/logs if possible

#### **What to Include**

```markdown
**Environment:**
- Board: STM32F407VGT6
- IDE: mikroC PRO for ARM v7.6.0
- OS: Windows 11 / Linux / macOS

**Expected Behavior:**
What should happen...

**Actual Behavior:**
What actually happens...

**Steps to Reproduce:**
1. Step one
2. Step two
3. See error

**Additional Context:**
Logs, screenshots, etc.
```

---

### ✨ **Suggesting Enhancements**

Have an idea for a new feature or improvement?

#### **Enhancement Checklist**

- [ ] 🔍 Check if it's already suggested
- [ ] 🎯 Explain the use case clearly
- [ ] 💡 Describe your proposed solution
- [ ] 🔄 Consider alternative approaches
- [ ] 📊 Estimate implementation complexity

---

## 🛠️ **Development Setup**

### 📋 **Prerequisites**

<table>
<tr>
<td>

#### **Hardware**
- ✅ STM32F407VGT6 board
- ✅ ST-Link programmer
- ✅ USB cable
- ✅ (Optional) Logic analyzer

</td>
<td>

#### **Software**
- ✅ mikroC PRO for ARM
- ✅ Visual TFT
- ✅ Git
- ✅ Code editor (VS Code recommended)

</td>
</tr>
</table>

### 🚀 **Getting Started**

#### **1. Fork & Clone**

```bash
# Fork the repo on GitHub first, then:

git clone https://github.com/YOUR-USERNAME/STM32_MikroC.git
cd STM32_MikroC
```

#### **2. Create a Branch**

```bash
# Create a branch for your feature/fix
git checkout -b feature/amazing-feature

# Or for bug fixes:
git checkout -b fix/bug-description
```

#### **3. Make Your Changes**

```bash
# Open the project in mikroC PRO
# Make your changes
# Test thoroughly on hardware
```

#### **4. Commit Your Changes**

```bash
# Stage your changes
git add .

# Commit with a meaningful message
git commit -m "feat: add amazing new feature"
```

#### **5. Push to GitHub**

```bash
git push origin feature/amazing-feature
```

#### **6. Open a Pull Request**

Go to GitHub and open a Pull Request!

---

## 📐 **Coding Guidelines**

### 🎨 **Code Style**

<table>
<tr>
<td width="50%">

#### **C Code Standards**

```c
// ✅ GOOD: Clear naming and comments
void initializeDisplay(void) {
    // Initialize TFT display
    TFT_Init(240, 320);
    TFT_Set_Pen(CL_WHITE, 1);
    TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
    TFT_Fill_Screen(CL_BLACK);
}

// ❌ BAD: No comments, unclear naming
void init(void) {
    TFT_Init(240, 320);
    TFT_Set_Pen(CL_WHITE, 1);
}
```

</td>
<td width="50%">

#### **Naming Conventions**

```c
// Functions: camelCase
void calculateEigenvalues(void);

// Variables: descriptive names
int imageWidth = 60;
int imageHeight = 80;

// Constants: UPPER_CASE
#define MAX_FEATURES 100
#define TETA_THRESHOLD 400

// Structs: PascalCase
typedef struct {
    float x;
    float y;
} Point;
```

</td>
</tr>
</table>

### 📝 **Documentation Standards**

#### **Function Documentation**

```c
/**
 * @brief Performs Principal Component Analysis on ear images
 *
 * @param images       Pointer to input image matrix (N x D)
 * @param numImages    Number of training images
 * @param numFeatures  Number of features per image
 * @param eigenvectors Output eigenface matrix
 * @param eigenvalues  Output eigenvalue array
 *
 * @return 0 on success, -1 on error
 *
 * @note Requires minimum 2 images for valid PCA
 * @warning Input images must be normalized [0-1]
 */
int performPCA(float* images, int numImages,
               int numFeatures, float* eigenvectors,
               float* eigenvalues);
```

### ✅ **Best Practices**

<details>
<summary><b>🎯 Memory Management</b></summary>

<br/>

```c
// ✅ GOOD: Check allocations
float* buffer = (float*)malloc(size * sizeof(float));
if (buffer == NULL) {
    return ERROR_OUT_OF_MEMORY;
}

// Use buffer...

free(buffer);
buffer = NULL;

// ❌ BAD: No error checking
float* buffer = (float*)malloc(size * sizeof(float));
// Use buffer without checking...
```

</details>

<details>
<summary><b>⚡ Performance Optimization</b></summary>

<br/>

```c
// ✅ GOOD: Use DSP instructions
arm_matrix_instance_f32 srcA;
arm_mat_init_f32(&srcA, rows, cols, data);
arm_mat_mult_f32(&srcA, &srcB, &dst);

// ❌ BAD: Naive loop (slow)
for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
        // Manual multiplication...
    }
}
```

</details>

<details>
<summary><b>🛡️ Error Handling</b></summary>

<br/>

```c
// ✅ GOOD: Proper error handling
typedef enum {
    STATUS_OK = 0,
    ERROR_INVALID_INPUT = -1,
    ERROR_OUT_OF_MEMORY = -2,
    ERROR_HARDWARE_FAILURE = -3
} Status;

Status processImage(uint8_t* image, int size) {
    if (image == NULL || size <= 0) {
        return ERROR_INVALID_INPUT;
    }

    // Process...

    return STATUS_OK;
}
```

</details>

---

## 💬 **Commit Message Guidelines**

### 📋 **Format**

```
<type>(<scope>): <subject>

<body>

<footer>
```

### 🏷️ **Types**

| Type | Description | Example |
|:-----|:------------|:--------|
| `feat` | New feature | `feat(pca): add eigenvalue computation` |
| `fix` | Bug fix | `fix(display): resolve touch calibration issue` |
| `docs` | Documentation | `docs(readme): update installation steps` |
| `style` | Code style | `style: format code with clang-format` |
| `refactor` | Code refactoring | `refactor(lda): optimize matrix operations` |
| `perf` | Performance improvement | `perf(dcva): reduce memory usage by 30%` |
| `test` | Add/update tests | `test(pca): add unit tests for PCA` |
| `chore` | Maintenance | `chore: update dependencies` |

### ✅ **Good Examples**

```bash
✅ feat(gui): add progress bar for training
✅ fix(adc): correct touch panel sampling rate
✅ docs(api): document all public functions
✅ perf(jacobi): optimize iteration loop
```

### ❌ **Bad Examples**

```bash
❌ fixed bug
❌ WIP
❌ Updated files
❌ asdfgh
```

---

## 🔄 **Pull Request Process**

### 📝 **PR Checklist**

Before submitting your PR, ensure:

- [ ] ✅ Code follows the style guidelines
- [ ] 📝 Comments added for complex logic
- [ ] 🧪 Code tested on real hardware
- [ ] 📖 Documentation updated (if needed)
- [ ] 🐛 No new warnings or errors
- [ ] ✨ Commit messages follow guidelines
- [ ] 🔀 Branch is up-to-date with main
- [ ] 📸 Screenshots included (if UI changes)

### 🎯 **PR Template**

```markdown
## Description
Brief description of changes...

## Type of Change
- [ ] 🐛 Bug fix
- [ ] ✨ New feature
- [ ] 📝 Documentation
- [ ] 🎨 UI/UX improvement
- [ ] ⚡ Performance improvement

## Testing
- [ ] Tested on STM32F407VGT6
- [ ] Verified with PCA algorithm
- [ ] Verified with LDA algorithm
- [ ] Verified with DCVA algorithm

## Screenshots (if applicable)
[Add screenshots here]

## Additional Notes
Any additional context...
```

### 🔍 **Review Process**

1. **Automated Checks** - CI/CD runs basic checks
2. **Code Review** - Maintainer reviews code
3. **Testing** - Changes tested on hardware
4. **Approval** - PR approved and merged

---

## 🧪 **Testing Guidelines**

### 📊 **Testing Strategy**

<table>
<tr>
<td>

#### **Unit Testing**
- Test individual functions
- Mock hardware interfaces
- Use assertions

</td>
<td>

#### **Integration Testing**
- Test component interactions
- Verify data flow
- Check edge cases

</td>
<td>

#### **Hardware Testing**
- Test on real STM32 board
- Verify peripheral operations
- Measure performance

</td>
</tr>
</table>

### ✅ **Test Requirements**

```c
// Example test structure
void test_PCA_eigenvalues(void) {
    // Setup
    float input[100] = { /* test data */ };
    float output[10];

    // Execute
    int result = computeEigenvalues(input, 100, output, 10);

    // Verify
    assert(result == 0);
    assert(output[0] > output[1]); // Descending order
}
```

---

## 📚 **Documentation**

### 📖 **What to Document**

<table>
<tr>
<td align="center">

### 📝 **Code**
Inline comments & function docs

</td>
<td align="center">

### 📘 **API**
Public interfaces & usage

</td>
<td align="center">

### 🎓 **Tutorials**
Step-by-step guides

</td>
<td align="center">

### 💡 **Examples**
Sample code & demos

</td>
</tr>
</table>

### ✍️ **Documentation Style**

```c
/**
 * Clear, concise description of what the function does.
 *
 * More detailed explanation if needed, including:
 * - Algorithm used
 * - Time/space complexity
 * - Special considerations
 *
 * @param[in]  input   Description of input parameter
 * @param[out] output  Description of output parameter
 * @return Description of return value
 *
 * @code
 * // Example usage:
 * float result;
 * myFunction(10, &result);
 * printf("Result: %f\n", result);
 * @endcode
 */
```

---

## 👥 **Community**

### 💬 **Get Help**

<div align="center">

<table>
<tr>
<td align="center">

### 💭 **Discussions**
![](https://img.shields.io/badge/GitHub-Discussions-181717?style=for-the-badge&logo=github)

[Join Discussions →](https://github.com/yourusername/STM32_MikroC/discussions)

</td>
<td align="center">

### 💬 **Discord**
![](https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)

[Join Discord →](https://discord.gg/your-invite)

</td>
<td align="center">

### 📧 **Email**
![](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)

[Contact Us →](mailto:your.email@example.com)

</td>
</tr>
</table>

</div>

### 🌟 **Recognition**

We appreciate all contributors! Your name will be:
- ✨ Added to our [Contributors](#) page
- 🏆 Featured in release notes
- 💖 Forever in our Git history

---

## 📜 **License**

By contributing, you agree that your contributions will be licensed under the MIT License.

---

<div align="center">

<!-- Footer -->
<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,20,12,24&height=150&section=footer" width="100%"/>

<br/>

### 🙏 **Thank You for Contributing!** 🙏

**Together, we make embedded AI accessible to everyone!**

<br/>

<a href="https://github.com/yourusername/STM32_MikroC/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=yourusername/STM32_MikroC" />
</a>

<br/><br/>

**[🏠 Back to README](README.md)** • **[📖 View Awesome Resources](AWESOME_RESOURCES.md)**

</div>

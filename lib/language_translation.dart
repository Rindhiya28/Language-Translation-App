import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage>
    with TickerProviderStateMixin {
  // Enhanced language list with pronunciation guide
  final Map<String, Map<String, String>> languages = {
    'English': {'code': 'en', 'flag': '🇺🇸', 'pronunciation': 'English'},
    'Spanish': {'code': 'es', 'flag': '🇪🇸', 'pronunciation': 'Español (es-pan-YOLE)'},
    'French': {'code': 'fr', 'flag': '🇫🇷', 'pronunciation': 'Français (fran-SAY)'},
    'German': {'code': 'de', 'flag': '🇩🇪', 'pronunciation': 'Deutsch (DOYTCH)'},
    'Italian': {'code': 'it', 'flag': '🇮🇹', 'pronunciation': 'Italiano (ee-tal-ee-AH-no)'},
    'Portuguese': {'code': 'pt', 'flag': '🇵🇹', 'pronunciation': 'Português (por-too-GESH)'},
    'Russian': {'code': 'ru', 'flag': '🇷🇺', 'pronunciation': 'Русский (ROOS-kee)'},
    'Chinese': {'code': 'zh', 'flag': '🇨🇳', 'pronunciation': '中文 (zhong-WEN)'},
    'Japanese': {'code': 'ja', 'flag': '🇯🇵', 'pronunciation': '日本語 (nee-hon-GO)'},
    'Korean': {'code': 'ko', 'flag': '🇰🇷', 'pronunciation': '한국어 (han-gook-EO)'},
    'Arabic': {'code': 'ar', 'flag': '🇸🇦', 'pronunciation': 'العربية (al-ara-BEE-ya)'},
    'Hindi': {'code': 'hi', 'flag': '🇮🇳', 'pronunciation': 'हिन्दी (HIN-dee)'},
    'Dutch': {'code': 'nl', 'flag': '🇳🇱', 'pronunciation': 'Nederlands (NEE-der-lahns)'},
    'Swedish': {'code': 'sv', 'flag': '🇸🇪', 'pronunciation': 'Svenska (SVEN-ska)'},
    'Norwegian': {'code': 'no', 'flag': '🇳🇴', 'pronunciation': 'Norsk (NORSHK)'},
    'Danish': {'code': 'da', 'flag': '🇩🇰', 'pronunciation': 'Dansk (DAHNSK)'},
    'Polish': {'code': 'pl', 'flag': '🇵🇱', 'pronunciation': 'Polski (POLE-skee)'},
    'Turkish': {'code': 'tr', 'flag': '🇹🇷', 'pronunciation': 'Türkçe (TURK-che)'},
    'Greek': {'code': 'el', 'flag': '🇬🇷', 'pronunciation': 'Ελληνικά (el-lee-nee-KAH)'},
    'Hebrew': {'code': 'he', 'flag': '🇮🇱', 'pronunciation': 'עברית (iv-REET)'},
    'Thai': {'code': 'th', 'flag': '🇹🇭', 'pronunciation': 'ภาษาไทย (pa-sa-TIE)'},
    'Vietnamese': {'code': 'vi', 'flag': '🇻🇳', 'pronunciation': 'Tiếng Việt (tee-eng vee-ET)'},
    'Indonesian': {'code': 'id', 'flag': '🇮🇩', 'pronunciation': 'Bahasa Indonesia (ba-HA-sa in-do-NEE-see-a)'},
    'Malay': {'code': 'ms', 'flag': '🇲🇾', 'pronunciation': 'Bahasa Melayu (ba-HA-sa me-LAH-yu)'},
    'Filipino': {'code': 'tl', 'flag': '🇵🇭', 'pronunciation': 'Filipino (fee-lee-PEE-no)'},
    'Czech': {'code': 'cs', 'flag': '🇨🇿', 'pronunciation': 'Čeština (CHESH-tee-na)'},
    'Hungarian': {'code': 'hu', 'flag': '🇭🇺', 'pronunciation': 'Magyar (MAH-dyar)'},
    'Romanian': {'code': 'ro', 'flag': '🇷🇴', 'pronunciation': 'Română (ro-MUH-na)'},
    'Bulgarian': {'code': 'bg', 'flag': '🇧🇬', 'pronunciation': 'Български (buhl-GAR-skee)'},
    'Croatian': {'code': 'hr', 'flag': '🇭🇷', 'pronunciation': 'Hrvatski (hr-VAHT-skee)'},
    'Slovak': {'code': 'sk', 'flag': '🇸🇰', 'pronunciation': 'Slovenčina (slo-VEN-chee-na)'},
    'Slovenian': {'code': 'sl', 'flag': '🇸🇮', 'pronunciation': 'Slovenščina (slo-VEN-shchee-na)'},
    'Estonian': {'code': 'et', 'flag': '🇪🇪', 'pronunciation': 'Eesti (EH-stee)'},
    'Latvian': {'code': 'lv', 'flag': '🇱🇻', 'pronunciation': 'Latviešu (lat-VEE-eshu)'},
    'Lithuanian': {'code': 'lt', 'flag': '🇱🇹', 'pronunciation': 'Lietuvių (lee-eh-too-VEE-oo)'},
    'Finnish': {'code': 'fi', 'flag': '🇫🇮', 'pronunciation': 'Suomi (SOO-oh-mee)'},
    'Ukrainian': {'code': 'uk', 'flag': '🇺🇦', 'pronunciation': 'Українська (oo-krah-EEN-ska)'},
    'Persian': {'code': 'fa', 'flag': '🇮🇷', 'pronunciation': 'فارسی (far-SEE)'},
    'Urdu': {'code': 'ur', 'flag': '🇵🇰', 'pronunciation': 'اردو (UR-doo)'},
    'Bengali': {'code': 'bn', 'flag': '🇧🇩', 'pronunciation': 'বাংলা (BAHNG-la)'},
    'Tamil': {'code': 'ta', 'flag': '🇱🇰', 'pronunciation': 'தமிழ் (ta-MIZH)'},
    'Telugu': {'code': 'te', 'flag': '🇮🇳', 'pronunciation': 'తెలుగు (te-LU-goo)'},
    'Gujarati': {'code': 'gu', 'flag': '🇮🇳', 'pronunciation': 'ગુજરાતી (goo-ja-RAH-tee)'},
    'Kannada': {'code': 'kn', 'flag': '🇮🇳', 'pronunciation': 'ಕನ್ನಡ (kan-na-DA)'},
    'Malayalam': {'code': 'ml', 'flag': '🇮🇳', 'pronunciation': 'മലയാളം (ma-la-YAH-lam)'},
    'Marathi': {'code': 'mr', 'flag': '🇮🇳', 'pronunciation': 'मराठी (ma-RAH-thee)'},
    'Punjabi': {'code': 'pa', 'flag': '🇮🇳', 'pronunciation': 'ਪੰਜਾਬੀ (pan-JAH-bee)'},
    'Swahili': {'code': 'sw', 'flag': '🇰🇪', 'pronunciation': 'Kiswahili (kee-swa-HEE-lee)'},
    'Afrikaans': {'code': 'af', 'flag': '🇿🇦', 'pronunciation': 'Afrikaans (af-ri-KAHNS)'},
  };

  String originLanguage = "Auto-detect";
  String destinationLanguage = "English";
  String output = "";
  String inputText = "";
  bool isTranslating = false;
  bool isCopied = false;
  TextEditingController languageController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late AnimationController _swapController;
  late Animation<double> _swapAnimation;
  late AnimationController _copyController;
  late Animation<double> _copyAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    _swapController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _swapAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _swapController, curve: Curves.elasticOut),
    );
    _copyController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _copyAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _copyController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _swapController.dispose();
    _copyController.dispose();
    languageController.dispose();
    super.dispose();
  }

  void translate(String src, String dest, String input) async {
    if (input.trim().isEmpty) {
      _showSnackBar("Please enter text to translate", isError: true);
      return;
    }
    setState(() {
      isTranslating = true;
      output = "";
    });
    try {
      GoogleTranslator translator = GoogleTranslator();
      var translation = await translator.translate(
        input,
        from: src == 'auto' ? 'auto' : src,
        to: dest,
      );
      setState(() {
        output = translation.text.toString();
        isTranslating = false;
      });
      _animationController.forward();
      HapticFeedback.lightImpact();
    } catch (e) {
      setState(() {
        output = "Translation failed. Please check your connection and try again.";
        isTranslating = false;
      });
      _showSnackBar("Translation failed", isError: true);
    }
  }

  String getLanguageCode(String language) {
    if (language == "Auto-detect") return "auto";
    return languages[language]?['code'] ?? "en";
  }

  void swapLanguages() {
    if (originLanguage != "Auto-detect" && destinationLanguage != "Auto-detect") {
      setState(() {
        String temp = originLanguage;
        originLanguage = destinationLanguage;
        destinationLanguage = temp;
      });
      _swapController.forward().then((_) => _swapController.reverse());
      HapticFeedback.selectionClick();
    }
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    setState(() => isCopied = true);
    _copyController.forward().then((_) => _copyController.reverse());
    _showSnackBar("Copied to clipboard!");
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => isCopied = false);
    });
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade600 : Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void clearText() {
    setState(() {
      languageController.clear();
      output = "";
      inputText = "";
    });
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e1a),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topRight,
            radius: 1.5,
            colors: [
              Color(0xff1a1f3a),
              Color(0xff0a0e1a),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      _buildLanguageSelector(),
                      const SizedBox(height: 24),
                      _buildInputSection(),
                      const SizedBox(height: 20),
                      _buildTranslateButton(),
                      const SizedBox(height: 24),
                      if (output.isNotEmpty) _buildOutputSection(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (inputText.isNotEmpty)
            IconButton(
              onPressed: clearText,
              icon: const Icon(Icons.clear_all_rounded),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
                foregroundColor: Colors.white70,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xff1e293b).withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.language_rounded,
                color: Color(0xff6366f1),
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                "Select Languages",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildAdvancedLanguageDropdown(
                  originLanguage,
                  "From",
                      (value) => setState(() => originLanguage = value!),
                  showAutoDetect: true,
                ),
              ),
              const SizedBox(width: 20),
              AnimatedBuilder(
                animation: _swapAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _swapAnimation.value * 3.14159,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff6366f1), Color(0xff8b5cf6)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff6366f1).withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          onTap: swapLanguages,
                          borderRadius: BorderRadius.circular(16),
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(
                              Icons.swap_horiz_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildAdvancedLanguageDropdown(
                  destinationLanguage,
                  "To",
                      (value) => setState(() => destinationLanguage = value!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedLanguageDropdown(
      String currentValue,
      String hint,
      ValueChanged<String?> onChanged, {
        bool showAutoDetect = false,
      }) {
    List<String> availableLanguages = languages.keys.toList();
    if (showAutoDetect) {
      availableLanguages.insert(0, "Auto-detect");
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xff0f172a),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: currentValue == hint ? null : currentValue,
          hint: Text(
            hint,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          icon: const Icon(
            Icons.expand_more_rounded,
            color: Colors.white60,
          ),
          dropdownColor: const Color(0xff1e293b),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          menuMaxHeight: 400,
          items: availableLanguages.map((String language) {
            String flag = language == "Auto-detect"
                ? "🌐"
                : languages[language]?['flag'] ?? "🏳️";
            return DropdownMenuItem<String>(
              value: language,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(flag, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      language,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1e293b).withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.edit_rounded,
                  color: Color(0xff6366f1),
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Enter Text",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (languageController.text.isNotEmpty)
                  Text(
                    "${languageController.text.length} characters",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: languageController,
              maxLines: 6,
              maxLength: 5000,
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
              decoration: InputDecoration(
                hintText: 'Type or paste your text here...',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 16,
                ),
                filled: true,
                fillColor: const Color(0xff0f172a),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xff6366f1),
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.all(20),
                counterStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTranslateButton() {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff6366f1), Color(0xff8b5cf6), Color(0xffa855f7)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff6366f1).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isTranslating || inputText.trim().isEmpty
            ? null
            : () {
          _animationController.reset();
          translate(
            getLanguageCode(originLanguage),
            getLanguageCode(destinationLanguage),
            languageController.text,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBackgroundColor: Colors.grey.withOpacity(0.3),
        ),
        child: isTranslating
            ? const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(width: 16),
            Text(
              "Translating...",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.translate_rounded,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              "Translate",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: inputText.trim().isEmpty
                    ? Colors.white60
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutputSection() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff064e3b),
              Color(0xff065f46),
              Color(0xff047857),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff064e3b).withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xff10b981),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff10b981).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Translation Result",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  ScaleTransition(
                    scale: _copyAnimation,
                    child: IconButton(
                      onPressed: () => copyToClipboard(output),
                      icon: Icon(
                        isCopied ? Icons.check_rounded : Icons.copy_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SelectableText(
                output,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Translated to ${destinationLanguage}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${languages[destinationLanguage]?['pronunciation'] ?? destinationLanguage}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
CheckUpdate
===

Code to check if there is a new version on the App Store.

✦ My macOS/iOS application ✦

<p style="display: inline_block">
    <a target="_blank" href="https://wangchujiang.com/key-clicker/" title="KeyClicker for macOS"><img align="center" alt="KeyClicker" height="50" width="50" src="https://github.com/user-attachments/assets/5a19fcb9-cb81-4855-b4ea-31c604d9612a"></a>
    <a target="_blank" href="https://wangchujiang.com/daybar/" title="DayBar for macOS"><img align="center" alt="DayBar" height="50" width="50" src="https://github.com/user-attachments/assets/b67d4a2e-92e2-4d8c-8c6f-2a1eb3e2fa93"></a>
    <a target="_blank" href="https://wangchujiang.com/iconed/" title="Iconed for macOS"><img align="center" alt="Iconed" height="50" width="50" src="https://github.com/user-attachments/assets/8a35dc7b-4faf-4e2a-9311-f66d6844a896"></a>
    <a target="_blank" href="https://wangchujiang.com/rightmenu-master/" title="RightMenu Master for macOS"><img align="center" alt="RightMenu Master" height="50" width="50" src="https://github.com/user-attachments/assets/39a76541-71bf-4de7-a01c-c62f0557dff5"></a>
    <a target="_blank" href="https://wangchujiang.com/paste-quick/" title="Paste Quick for macOS"><img align="center" alt="Quick RSS" height="50" width="50" src="https://github.com/user-attachments/assets/bdaad5b7-9810-44ce-8f17-8410864465d2"></a>
    <a target="_blank" href="https://wangchujiang.com/quick-rss/" title="Quick RSS for macOS/iOS"><img align="center" alt="Quick RSS" height="50" width="50" src="https://github.com/user-attachments/assets/374106b5-a448-4d1d-9ccb-b04b6bc681ed"></a>
    <a target="_blank" href="https://wangchujiang.com/web-serve/" title="Web Serve for macOS"><img align="center" alt="Web Serve" height="50" width="50" src="https://github.com/user-attachments/assets/e1d9f76f-0f3d-4ba5-8a15-253ee173bb1c"></a>
    <a target="_blank" href="https://wangchujiang.com/copybook-generator/" title="Copybook Generator for macOS/iOS"><img align="center" alt="Copybook Generator" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/b90e42ff-158b-4534-82ca-5898fd0e8d73"></a>
    <a target="_blank" href="https://wangchujiang.com/devtutor/" title="DevTutor for macOS/iOS"><img align="center" alt="DevTutor for SwiftUI" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/f15c154d-0192-48eb-8e0e-9e245ffd974a"></a>
    <a target="_blank" href="https://wangchujiang.com/regex-mate/" title="RegexMate for macOS/iOS"><img align="center" alt="RegexMate" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/aabe5aa9-9a96-4390-8bed-c3e4023d0dea"></a>
    <a target="_blank" href="https://wangchujiang.com/time-passage/" title="Time Passage for macOS/iOS"><img align="center" alt="Time Passage" height="50" width="50" src="https://github.com/jaywcjlove/time-passage/assets/1680273/6f30e429-e6f3-4dbe-9921-a5effe2a05e9"></a>
    <a target="_blank" href="https://wangchujiang.com/IconizeFolder/" title="IconizeFolder for macOS"><img align="center" alt="Iconize Folder" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/fa9d8b9c-1e51-4ded-877c-fa5b21c47220"></a>
    <a target="_blank" href="https://wangchujiang.com/TextSoundSaver/" title="Textsound Saver for macOS/iOS"><img align="center" alt="Textsound Saver" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/0595e842-980b-4574-8891-a8ba853a08be"></a>
    <a target="_blank" href="https://wangchujiang.com/create-custom-symbols/" title="Create Custom Symbols for macOS"><img align="center" alt="Create Custom Symbols" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/8cd022ce-a3f1-4e89-b7c6-6fbd0d4db77c"></a>
    <a target="_blank" href="https://wangchujiang.com/DevHub/" title="DevHub for macOS"><img align="center" alt="DevHub" height="50" width="50" src="https://github.com/user-attachments/assets/4a44a4fd-67ce-430b-af0a-72f18feaa47d"></a>
    <a target="_blank" href="https://wangchujiang.com/ResumeRevise/" title="Resume Revise for macOS"><img align="center" alt="Resume Revise" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/c9954a20-1905-48de-bdf8-d71837974aa2"></a>
    <a target="_blank" href="https://wangchujiang.com/palette-genius/" title="Palette Genius for macOS"><img align="center" alt="Palette Genius" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/27340413-d355-45b2-8f6f-6ac37682d957"></a>
    <a target="_blank" href="https://wangchujiang.com/symbol-scribe/" title="Symbol Scribe for macOS"><img align="center" alt="Symbol Scribe" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/c7249f05-fa70-4def-a1e9-571d5f171fc9"></a>
</p>
<br>

## Usage

```swift
import CheckUpdate

CheckUpdate.checkVersion { isUpdateNeeded, appStoreVersion, currentVersion in

}

CheckUpdate.checkVersion(bundleId: "com.wangchujiang.daybar") { isUpdateNeeded, appStoreVersion, currentVersion in
    // appStoreVersion -> "1.0"
    // currentVersion -> 2.0"
    // isUpdateNeeded -> false
}

CheckUpdate.checkVersion(bundleId: "com.wangchujiang.daybar") { isUpdateNeeded, appStoreVersion, currentVersion in
    // appStoreVersion -> "2.0"
    // currentVersion -> 1.0"
    // isUpdateNeeded -> true
}
```

## License

Licensed under the MIT License.
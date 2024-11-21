/**
 * description-formatter.js
 * Utility để format các loại description khác nhau như video, bài viết, profile, etc.
 */

const DescriptionFormatter = {
    // Các cấu hình mặc định
    config: {
        enableLinks: true,
        enableHashtags: true,
        enableEmoji: true,
        enableLineBreaks: true,
        linkClass: 'content-link',
        hashtagClass: 'hashtag',
        target: '_blank'
    },

    // Các regex patterns
    patterns: {
        url: /(https?:\/\/[^\s<]+)/g,
        hashtag: /#(\w+)/g,
        email: /([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/g,
        phone: /(\+?\d{1,4})?[-.\s]?\(?\d{1,3}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}/g,
        unicode: {
            'Đ': /\u0110/g,
            'đ': /\u0111/g,
            'ư': /\u01B0/g,
            'ơ': /\u01A1/g,
            'ă': /\u0103/g,
            'â': /\u00E2/g,
            'ê': /\u00EA/g,
            'ô': /\u00F4/g,
            '•': /\u2022|\?/g
        }
    },

    /**
     * Format description với các tùy chọn tùy chỉnh
     * @param {string} text - Text cần format
     * @param {Object} customConfig - Cấu hình tùy chỉnh (optional)
     */
    format(text, customConfig = {}) {
        if (!text) return '';

        // Merge custom config với config mặc định
        const config = { ...this.config, ...customConfig };
        let formattedText = text;

        // Xử lý các ký tự Unicode đặc biệt
        Object.entries(this.patterns.unicode).forEach(([replacement, pattern]) => {
            formattedText = formattedText.replace(pattern, replacement);
        });

        // Xử lý xuống dòng
        if (config.enableLineBreaks) {
            formattedText = formattedText.replace(/\\n/g, '<br>');
        }

        // Xử lý URLs
        if (config.enableLinks) {
            formattedText = formattedText.replace(
                this.patterns.url,
                `<a href="$1" class="${config.linkClass}" target="${config.target}" rel="noopener noreferrer">$1</a>`
            );

            // Xử lý emails
            formattedText = formattedText.replace(
                this.patterns.email,
                `<a href="mailto:$1" class="${config.linkClass}">$1</a>`
            );

            // Xử lý số điện thoại
            formattedText = formattedText.replace(
                this.patterns.phone,
                `<span class="phone-number">$1</span>`
            );
        }

        // Xử lý hashtags
        if (config.enableHashtags) {
            formattedText = formattedText.replace(
                this.patterns.hashtag,
                `<a href="javascript:void(0)" class="${config.hashtagClass}" data-tag="$1" onclick="DescriptionFormatter.handleHashtagClick('$1')">#$1</a>`
            );
        }

        return formattedText;
    },

    /**
     * Format và apply vào element
     * @param {string|Element} selector - CSS selector hoặc Element
     * @param {Object} customConfig - Cấu hình tùy chỉnh (optional)
     */
    applyToElement(selector, customConfig = {}) {
        const elements = typeof selector === 'string'
            ? document.querySelectorAll(selector)
            : [selector];

        elements.forEach(element => {
            const rawText = element.getAttribute('data-description') || element.textContent;
            element.innerHTML = this.format(rawText, customConfig);
        });
    },

    /**
     * Xử lý sự kiện click hashtag
     * @param {string} tag - Hashtag được click
     */
    handleHashtagClick(tag) {
        // Có thể customize xử lý hashtag ở đây
        console.log(`Hashtag clicked: ${tag}`);
        // Ví dụ: window.location.href = `/search?tag=${tag}`;
    },

    /**
     * Initialize formatter với các elements trên trang
     * @param {string} selector - CSS selector cho các elements cần format
     * @param {Object} customConfig - Cấu hình tùy chỉnh (optional)
     */
    init(selector = '.format-description', customConfig = {}) {
        document.addEventListener('DOMContentLoaded', () => {
            this.applyToElement(selector, customConfig);
        });
    }
};

// Export để có thể sử dụng như một module
if (typeof module !== 'undefined' && module.exports) {
    module.exports = DescriptionFormatter;
}
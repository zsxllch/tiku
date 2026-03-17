// 导出页面为Docx格式
import { asBlob } from 'html-docx-js-typescript';
import { saveAs } from 'file-saver';

// 辅助函数：将图片 URL 转换为 Base64
async function convertImagesToBase64(element) {
    const images = element.querySelectorAll('img');
    const promises = Array.from(images).map(async (img) => {
        try {
            const src = img.getAttribute('src');
            if (!src || src.startsWith('data:')) return;
            
            // 如果是相对路径，转为绝对路径
            const url = new URL(src, window.location.origin).href;
            
            const response = await fetch(url);
            const blob = await response.blob();
            
            return new Promise((resolve, reject) => {
                const reader = new FileReader();
                reader.onloadend = () => {
                    img.setAttribute('src', reader.result);
                    // 为了在 Word 中更好地控制图片大小，可以设置具体的宽高
                    // 这里我们假设图片应该有一定的最大宽度，适应 A4 纸
                    // Word 中 1cm ≈ 28.35pt, A4 宽 21cm, 减去页边距(2.54*2) ≈ 16cm ≈ 450px
                    // 保持原比例，只限制最大宽度
                    img.style.maxWidth = '400px'; 
                    img.style.height = 'auto';
                    resolve();
                };
                reader.onerror = reject;
                reader.readAsDataURL(blob);
            });
        } catch (error) {
            console.error('Image conversion failed:', error);
            // 失败时不阻断，保留原 src
        }
    });
    
    await Promise.all(promises);
}

export async function getDocx(title, id) {
    // 克隆节点以免影响页面显示
    const originalElement = document.querySelector(`#${id}`);
    if (!originalElement) {
        console.error(`Element with id ${id} not found`);
        return;
    }
    const clonedElement = originalElement.cloneNode(true);
    
    // 处理图片转 Base64
    await convertImagesToBase64(clonedElement);
    
    const contentHtml = clonedElement.innerHTML;
    
    // 创建一个包含样式的完整HTML文档
    // 添加 @page 规则设置 A4 纸张和边距
    const fullHtml = `
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <style>
                @page {
                    size: A4;
                    margin: 2.54cm;
                }
                body {
                    font-family: 'SimSun', '宋体', serif;
                    line-height: 1.5;
                    font-size: 10.5pt; /* 五号字 */
                }
                h2 {
                    text-align: center;
                    font-size: 16pt; /* 三号字 */
                    font-weight: bold;
                    margin-bottom: 20px;
                }
                h3 {
                    text-align: center;
                    font-size: 15pt; /* 小三号字 */
                    font-weight: bold;
                    margin-bottom: 15px;
                }
                h4 {
                    font-size: 12pt; /* 小四号字 */
                    font-weight: bold;
                    margin-top: 15px;
                    margin-bottom: 10px;
                }
                h5 {
                    font-size: 12pt; /* 小四号字 */
                    font-weight: bold;
                    margin-top: 15px;
                    margin-bottom: 10px;
                }
                .question-container {
                    margin-bottom: 10px;
                    page-break-inside: avoid; /* 尽量避免题目被分页切断 */
                }
                .cho {
                    margin-left: 0;
                    font-size: 10.5pt;
                }
                .opt {
                    margin-left: 20px;
                    display: block;
                    font-size: 10.5pt;
                }
                .img-container {
                    text-align: right; /* 图片靠右 */
                    margin: 5px 0;
                }
                img {
                    max-width: 400px; /* 限制图片大小 */
                    height: auto;
                }
            </style>
        </head>
        <body>
            ${contentHtml}
        </body>
        </html>
    `;

    asBlob(fullHtml).then(data => {
        saveAs(data, title + '.docx');
    });
}

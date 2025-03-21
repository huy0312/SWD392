package Model;

import java.util.Date;

public class News {
    private int id;
    private String title;
    private String content;
    private String author;
    private Date publishedAt;

    public News() {
    }
    
    

    public News(int id, String title, String content, String author, Date publishedAt) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.publishedAt = publishedAt;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getContent() { return content; }
    public String getAuthor() { return author; }
    public Date getPublishedAt() { return publishedAt; }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPublishedAt(Date publishedAt) {
        this.publishedAt = publishedAt;
    }
    
    
}

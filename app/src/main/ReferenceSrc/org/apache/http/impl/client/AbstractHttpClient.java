package org.apache.http.impl.client;

import java.io.IOException;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.auth.AuthSchemeRegistry;
import org.apache.http.client.AuthenticationHandler;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.RequestDirector;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.cookie.CookieSpecRegistry;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpProcessor;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/client/AbstractHttpClient.class */
public abstract class AbstractHttpClient implements HttpClient {
    protected AbstractHttpClient(ClientConnectionManager clientConnectionManager, HttpParams httpParams) {
        throw new RuntimeException("Stub!");
    }

    public void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor, int i) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void addResponseInterceptor(HttpResponseInterceptor httpResponseInterceptor) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void addResponseInterceptor(HttpResponseInterceptor httpResponseInterceptor, int i) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void clearRequestInterceptors() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void clearResponseInterceptors() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    protected abstract AuthSchemeRegistry createAuthSchemeRegistry();

    protected abstract ClientConnectionManager createClientConnectionManager();

    protected RequestDirector createClientRequestDirector(HttpRequestExecutor httpRequestExecutor, ClientConnectionManager clientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy, HttpRoutePlanner httpRoutePlanner, HttpProcessor httpProcessor, HttpRequestRetryHandler httpRequestRetryHandler, RedirectHandler redirectHandler, AuthenticationHandler authenticationHandler, AuthenticationHandler authenticationHandler2, UserTokenHandler userTokenHandler, HttpParams httpParams) {
        throw new RuntimeException("Stub!");
    }

    protected abstract ConnectionKeepAliveStrategy createConnectionKeepAliveStrategy();

    protected abstract ConnectionReuseStrategy createConnectionReuseStrategy();

    protected abstract CookieSpecRegistry createCookieSpecRegistry();

    protected abstract CookieStore createCookieStore();

    protected abstract CredentialsProvider createCredentialsProvider();

    protected abstract HttpContext createHttpContext();

    protected abstract HttpParams createHttpParams();

    protected abstract BasicHttpProcessor createHttpProcessor();

    protected abstract HttpRequestRetryHandler createHttpRequestRetryHandler();

    protected abstract HttpRoutePlanner createHttpRoutePlanner();

    protected abstract AuthenticationHandler createProxyAuthenticationHandler();

    protected abstract RedirectHandler createRedirectHandler();

    protected abstract HttpRequestExecutor createRequestExecutor();

    protected abstract AuthenticationHandler createTargetAuthenticationHandler();

    protected abstract UserTokenHandler createUserTokenHandler();

    protected HttpParams determineParams(HttpRequest httpRequest) {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.HttpClient
    public <T> T execute(HttpHost httpHost, HttpRequest httpRequest, ResponseHandler<? extends T> responseHandler) throws IOException, ClientProtocolException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.HttpClient
    public <T> T execute(HttpHost httpHost, HttpRequest httpRequest, ResponseHandler<? extends T> responseHandler, HttpContext httpContext) throws IOException, ClientProtocolException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.HttpClient
    public <T> T execute(HttpUriRequest httpUriRequest, ResponseHandler<? extends T> responseHandler) throws IOException, ClientProtocolException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.HttpClient
    public <T> T execute(HttpUriRequest httpUriRequest, ResponseHandler<? extends T> responseHandler, HttpContext httpContext) throws IOException, ClientProtocolException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.HttpClient
    public final HttpResponse execute(HttpHost httpHost, HttpRequest httpRequest) throws IOException, ClientProtocolException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.HttpClient
    public final HttpResponse execute(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws IOException, ClientProtocolException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.HttpClient
    public final HttpResponse execute(HttpUriRequest httpUriRequest) throws IOException, ClientProtocolException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.HttpClient
    public final HttpResponse execute(HttpUriRequest httpUriRequest, HttpContext httpContext) throws IOException, ClientProtocolException {
        throw new RuntimeException("Stub!");
    }

    public final AuthSchemeRegistry getAuthSchemes() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final ConnectionKeepAliveStrategy getConnectionKeepAliveStrategy() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.client.HttpClient
    public final ClientConnectionManager getConnectionManager() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final ConnectionReuseStrategy getConnectionReuseStrategy() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final CookieSpecRegistry getCookieSpecs() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final CookieStore getCookieStore() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final CredentialsProvider getCredentialsProvider() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    protected final BasicHttpProcessor getHttpProcessor() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final HttpRequestRetryHandler getHttpRequestRetryHandler() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.client.HttpClient
    public final HttpParams getParams() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final AuthenticationHandler getProxyAuthenticationHandler() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final RedirectHandler getRedirectHandler() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final HttpRequestExecutor getRequestExecutor() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public HttpRequestInterceptor getRequestInterceptor(int i) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public int getRequestInterceptorCount() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public HttpResponseInterceptor getResponseInterceptor(int i) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public int getResponseInterceptorCount() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final HttpRoutePlanner getRoutePlanner() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final AuthenticationHandler getTargetAuthenticationHandler() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final UserTokenHandler getUserTokenHandler() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void removeRequestInterceptorByClass(Class<? extends HttpRequestInterceptor> cls) {
        throw new RuntimeException("Stub!");
    }

    public void removeResponseInterceptorByClass(Class<? extends HttpResponseInterceptor> cls) {
        throw new RuntimeException("Stub!");
    }

    public void setAuthSchemes(AuthSchemeRegistry authSchemeRegistry) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setCookieSpecs(CookieSpecRegistry cookieSpecRegistry) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setCookieStore(CookieStore cookieStore) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setCredentialsProvider(CredentialsProvider credentialsProvider) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setHttpRequestRetryHandler(HttpRequestRetryHandler httpRequestRetryHandler) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setKeepAliveStrategy(ConnectionKeepAliveStrategy connectionKeepAliveStrategy) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setParams(HttpParams httpParams) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setProxyAuthenticationHandler(AuthenticationHandler authenticationHandler) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setRedirectHandler(RedirectHandler redirectHandler) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setReuseStrategy(ConnectionReuseStrategy connectionReuseStrategy) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setRoutePlanner(HttpRoutePlanner httpRoutePlanner) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setTargetAuthenticationHandler(AuthenticationHandler authenticationHandler) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setUserTokenHandler(UserTokenHandler userTokenHandler) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }
}

# Benefits of Signing Commits

Signing commits offers several key benefits:

1. **Verification of Authenticity**:
   - When a commit or tag is signed, GitHub marks it as "Verified" if the signature can be cryptographically verified.
   - This provides confidence about the origin of the change, ensuring the commit is from a trusted source.

2. **Commit Security**:
   - GPG, SSH, or S/MIME signatures can be used to sign commits.
   - GPG keys can expire or be revoked, offering additional control over security.
   - S/MIME signatures are typically used in organizational settings, adding a higher level of security for corporate users.

3. **Protection Against Unauthorized Changes**:
   - Repository administrators can enforce required commit signing on protected branches, blocking all unsigned or unverified commits.

4. **Compatibility**:
   - GitHub automatically verifies GPG and SSH-signed commits using OpenPGP and ssh_data libraries.
   - SSH keys can be reused for both authentication and commit signing, simplifying setup.

5. **Vigilant Mode**:
   - For users who enable vigilant mode, GitHub provides even stricter verification, marking commits as "Verified" or "Partially Verified" based on the authorship.

6. **Organizational Use**:
   - S/MIME signatures, typically used by organizations, allow commits to be signed with an X.509 key.
   - Bots can also sign commits on behalf of GitHub Apps, ensuring automated processes maintain security and verification.

These benefits contribute to better trust, security, and integrity of code changes in both personal and organizational repositories.